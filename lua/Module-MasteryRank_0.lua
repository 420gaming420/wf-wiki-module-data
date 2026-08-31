--- '''MasteryRank''' is a helper module for constructing wikitables pertaining to
--  [[Mastery Rank]] and [[Clan]] affinity.<br />
--  
--  On this Wiki, MasteryRank is used in:
--  * [[Template:MasteryTable]]
--  * [[Template:ClanAffinityTable]]
--  
--  @module     masteryrank
--  @alias      p
--  @author     [[User:FINNER|FINNER]]
--  @attribution [[User:Synthtech|Synthtech]]
--  @attribution [[User:Cephalon Scientia|Cephalon Scientia]]
--  @image      Mastery Info New.png
--  @require    [[Module:Arguments]]
--  @require    [[Module:Version]]
--  @require    [[Module:Math]]
--  @release    stable
--  

local p = {}

local Version = require("Module:Version")
local Math = require("Module:Math")
local Weapons, Warframes, Companions

-- If you change this, don't forget to add the extra 1000 XP in buildMasteryTable as well
local MASTERY_CLASSES = {
    [0]="Unranked", "Initiate", "Novice", "Disciple", "Seeker", 
    "Hunter", "Eagle", "Tiger", "Dragon", "Sage", "Master", 
}
-- Mapping keys to base mastery xp at max rank 
-- (excluding rank 40 weapons which are edge cases)
local baseMasteryXp = {
    warframes = 6000,
    primaries = 3000,
    secondaries = 3000,
    melee = 3000,
    kitguns = 3000,
    amps = 3000,
    companions = 6000, kubrows = 6000, kavats = 6000, predasite = 6000, vulpaphyla = 6000, moas = 6000, hounds = 6000, sentinels = 6000,
    plexus = 6000,
    sentinelWeapons = 3000, roboticWeapons = 3000, houndWeapons = 3000,
    archwings = 6000,
    archGuns = 3000,
    archMelees = 3000,
    ['k-drives'] = 6000,
    necramechs = 8000,
    junctions = 1000,
    railjackIntrinsics = 1500,
    drifterIntrinsics = 1500,
}
local RankForties = {
    primaries = 12+7+5, -- kuva + tenet + coda
    secondaries = 5+5+4, -- kuva + tenet + coda
    melee = 2+4+5+1, -- kuva + tenet + coda + paracesis
    archGuns = 2, -- kuva
}

local function getRankName(rank)
    return (
            rank <= 27 and ({ [0]="", "Silver ", "Gold " })[rank % 3]
            or             ({ [0]="", "Middle ", "True " })[rank - 28]  -- Master
            or  ""  -- Legendary
        )
        .. (MASTERY_CLASSES[math.ceil(rank / 3)] or "Legendary") 
        .. (  rank > 30 and ' '..(rank - 30) or ''  ) -- Legendary (X)
end

local function getRankXP(Rank)
    local legRank = math.max(0, Rank - 30)
    Rank = math.min(Rank, 30)
    return 2500 * Rank ^ 2  +  legRank * 147500
end
local legendaryXP = getRankXP(30) --2500 * 30 ^ 2
local function getXPRank(XP)
    local legXP = math.max(0, XP - legendaryXP)
    XP = math.min(XP, legendaryXP)
    return math.floor((XP / 2500) ^ 0.5  +  legXP / 147500)
end

local function getMasteryRank(xp)
    local rank = getXPRank(xp)
    return 'MR'..rank..' ('..getRankName(rank)..'); '..
        Math.formatnum(getRankXP(rank+1) - xp)..' Mastery until MR'..(rank+1)..' ('..getRankName(rank+1)..')'
end

local function buildMasteryTable(argTable)
    -- local ... = Args.getArgs(...)

    local function masteryFrom(key, format)
        if format == true then format = function(n) return n end
        elseif not format then format = Math.formatnum
        end

        if key == 'missions' then
            return format(argTable['missionsXp'])
        end

        if not baseMasteryXp[key] then error('invalid key '..key..', no baseMasteryXp') end
        if not argTable[key]      then error('invalid key '..key..', no argTable'     ) end

        return format(argTable[key] * baseMasteryXp[key]
         + (RankForties[key] or 0) * baseMasteryXp[key]/3)
    end

    -- Missions and junctions needed to be counted a second time for Steel Path
    local totalCount = argTable['missions'] + argTable['junctions']
    local totalXp = argTable['missionsXp'] + masteryFrom('junctions', true)
    for argName, value in pairs(argTable) do
        if true
            and argName ~= 'ver'
            and argName ~= 'companions'
            and argName ~= 'sentinelWeapons'
            and argName ~= 'exclusives'
            and argName ~= 'exclusivesXp'
            and argName ~= 'missionsXp'
        then
            totalCount = totalCount + value
            totalXp = totalXp + masteryFrom(argName, true)
        end
    end

    return ([=[
        {| class="article-table" style="margin:1em auto;"
        |+ <small><span style="text-transform:uppercase; color:var(--positive-text-color);">Last updated: <span style="text-decoration:underline;">%s</span>&nbsp;</span></small>
        ! style="text-align:center;" | Category
        ! style="text-align:left;"   | Count
        ! style="text-align:left;"   | [[File:MasteryAffinity64.png|x26px|class=icon|link=]]Mastery
        |-
        | [[Warframes]] || %d || %s
        |-
        | [[:Category:Primary Weapons|Primaries]] || %d || %s
        |-
        | [[:Category:Secondary Weapons|Secondaries]] || %d || %s
        |-
        | [[:Category:Melee Weapons|Melee]]<br />(including [[Zaw]]s) || %d || %s
        |-
        | [[Kitgun]]s || %d || %s
        |-
        | colspan=3 |
        |-
        | Normal [[Planet|Missions]] (nodes + [[Junction]]s) || %d (%d + %d) || %s (%d + %s)
        |-
        | [[The Steel Path]] (nodes + [[Junction]]s) || %d (%d + %d) || %s (%d + %s)
        |-
        | [[Railjack/Intrinsics|Railjack Intrinsics]] || %d || %s
        |-
        | [[Drifter/Intrinsics|Drifter Intrinsics]] || %d || %s
        |-
        | colspan=3 |
        |-
        | [[Sentinel]]s || %d || %s
        |-
        | Sentinel Weapons || %d || %s
        |-
        | style="padding-left:40px" | [[:Category:Robotic Weapons|Robotic Weapons]] || %d || %s
        |-
        | style="padding-left:40px" | [[:Category:Hound Weapons|Hound Weapons]] || %d || %s
        |-
        | [[Companion]]s || %d || %s
        |-
        | style="padding-left:40px" | [[Kubrow]]s || %d || %s
        |-
        | style="padding-left:40px" | [[Kavat]]s || %d || %s
        |-
        | style="padding-left:40px" | [[Predasite]]s || %d || %s
        |-
        | style="padding-left:40px" | [[Vulpaphyla]]s || %d || %s
        |-
        | style="padding-left:40px" | [[MOA (Companion)|MOA]]s || %d || %s
        |-
        | style="padding-left:40px" | [[Hound]]s || %d || %s
        |-
        | style="padding-left:40px" | [[Plexus]] || %d || %s
        |-
        | colspan=3 |
        |-
        | [[Archwing]]s || %d || %s
        |-
        | [[Archgun]]s || %d || %s
        |-
        | [[Archmelee]]s || %d || %s
        |-
        | [[Amp]]s || %d || %s
        |-
        | [[K-Drive]]s || %d || %s
        |-
        | [[Necramech]]s || %d || %s
        |-
        ! Total !! %d !! %s<ref>%s</ref>
        |-
        ! Minus [[Exclusive Mastery|Exclusives]] !! %d !! %s<ref>%s</ref>
        |-
        |}
        ]=]):format(
        argTable['ver'] and Version.getVersionLink(argTable['ver']) or 'N/A',
        argTable['warframes'],       masteryFrom'warframes',
        argTable['primaries'],       masteryFrom'primaries',
        argTable['secondaries'],     masteryFrom'secondaries',
        argTable['melee'],           masteryFrom'melee',
        argTable['kitguns'],         masteryFrom'kitguns',
        argTable['missions'] + argTable['junctions'], argTable['missions'], argTable['junctions'], Math.formatnum(argTable['missionsXp'] + masteryFrom('junctions',true)), argTable['missionsXp'],                                                   masteryFrom'junctions',
        argTable['missions'] + argTable['junctions'], argTable['missions'], argTable['junctions'], Math.formatnum(argTable['missionsXp'] + masteryFrom('junctions',true)), argTable['missionsXp'],                                                   masteryFrom'junctions',
        argTable['railjackIntrinsics'], masteryFrom'railjackIntrinsics',
        argTable['drifterIntrinsics'],  masteryFrom'drifterIntrinsics',
        argTable['sentinels'],       masteryFrom'sentinels',
        argTable['sentinelWeapons'], masteryFrom'sentinelWeapons',
        argTable['roboticWeapons'],  masteryFrom'roboticWeapons',
        argTable['houndWeapons'],    masteryFrom'houndWeapons',
        argTable['companions'],      masteryFrom'companions',
        argTable['kubrows'],         masteryFrom'kubrows',
        argTable['kavats'],          masteryFrom'kavats',
        argTable['predasite'],       masteryFrom'predasite',
        argTable['vulpaphyla'],      masteryFrom'vulpaphyla',
        argTable['moas'],            masteryFrom'moas',
        argTable['hounds'],          masteryFrom'hounds',
        argTable['plexus'],          masteryFrom'plexus',
        argTable['archwings'],       masteryFrom'archwings',
        argTable['archGuns'],        masteryFrom'archGuns',
        argTable['archMelees'],      masteryFrom'archMelees',
        argTable['amps'],            masteryFrom'amps',
        argTable['k-drives'],        masteryFrom'k-drives',
        argTable['necramechs'],      masteryFrom'necramechs',
        totalCount, Math.formatnum(totalXp), getMasteryRank(totalXp),
        totalCount - argTable['exclusives'], Math.formatnum(totalXp - argTable['exclusivesXp']), getMasteryRank(totalXp - argTable['exclusivesXp'])
    )
end

--- Builds total Mastery table.
--  @function       p.buildMasteryTable
--  @param          {table} frame contains all following args
--  @param          {string} ver current game version as of last edit of the following information
--  @param          {string} k-drives kdrive board count
--  @param          {string} missions mission count
--  @param          {string} missionsXp total mission mastery, without junctions
--  @param          {string} junctions junction count
--  @param          {string} railjackIntrinsics intrinsic categories for a railjack
--  @param          {string} drifterIntrinsics intrinsic categories for a drifter
--  @param          {string} exclusives total count of exclusive mastery-granting items
--  @param          {string} exclusivesXp and its total xp
--  @return         {string} Resultant table in wikitext
function p.buildMasteryTable(frame)
    assert(frame and frame.args ~= nil, 'p.buildMasteryTable(frame): must pass the number of items in each category')
    assert(frame and frame.args, 'p.buildMasteryTable{args={}}')
    local args = {}
    args.ver                = frame.args.ver
    args['k-drives']        = frame.args['k-drives']
    args.missions           = frame.args.missions
    args.missionsXp         = frame.args.missionsXp
    args.junctions          = frame.args.junctions
    args.railjackIntrinsics = frame.args.railjackIntrinsics
    args.drifterIntrinsics  = frame.args.drifterIntrinsics
    args.exclusives         = frame.args.exclusives
    args.exclusivesXp       = frame.args.exclusivesXp

    Weapons = Weapons or require 'Module:Weapons'
    args.primaries = Weapons._getWeaponCount 'primary'
    args.secondaries = Weapons._getWeaponCount 'secondary'
    args.melee = Weapons._getWeaponCount 'melee' + Weapons._getWeaponCount 'zaw'
    args.kitguns = Weapons._getWeaponCount 'kitgun'
    args.amps = Weapons._getWeaponCount 'amp'
    args.houndWeapons = Weapons._getWeaponCount 'hound'
    args.roboticWeapons = Weapons._getWeaponCount 'robotic'
    args.sentinelWeapons = args.houndWeapons+args.roboticWeapons
    args.archGuns = Weapons._getWeaponCount 'archgun'
    args.archMelees = Weapons._getWeaponCount 'archmelee'

    Warframes = Warframes or require 'Module:Warframes'
    args.warframes = Warframes.getWarframeCount{}
    args.archwings = Warframes.getWarframeCount{args={'Archwings'}}
    args.necramechs = Warframes.getWarframeCount{args={'Necramechs'}}

    Companions = Companions or mw.loadData'Module:Companions/data'
    args.companions = 0
    + 1; args.plexus = 1
    args.kubrows = 0; args.kavats = 0; args.predasite = 0; args.vulpaphyla = 0; args.moas = 0; args.hounds = 0
    args.sentinels = 0
    for k, v in pairs(Companions.Companions) do
        local name = v.Type:lower():gsub(' %(.*%)','')
        if name~='predasite' and name~='vulpaphyla' then name=name..'s' end
        if name~='sentinels' then args.companions=args.companions + 1 end
        assert(args[name],'there\'s no '..name)
        args[name]=args[name] + 1
    end

    -- Missions = Missions or require 'Module:Missions'
    -- Intrinsics
    -- Exclusives
    -- K-Drives

    return frame:preprocess(buildMasteryTable(args))
end

local function getClanRank(totalXp)
    local ranks = {
        11000, 34000, 69000, 114000, 168000, 231000, 302000, 381000, 
        468000, 563000, 665000, 774000, 891000
    }
    local rank

    for i, rankXp in ipairs(ranks) do
        if totalXp < rankXp then
            rank = i - 1
            break
        end
    end

    if rank == nil then
        rank = #ranks
    end

    local str = ""
    if rank < #ranks then
        local tillNext = Math.formatnum(ranks[rank + 1] - totalXp)
        str = 'Rank '..rank..', ('..tillNext..' Affinity until next rank)'
    else
        str = 'Rank '..rank
    end

    return str
end

local function buildClanAffinityTable(argTable)
    -- local ... = Args.getArgs(...)

    local tHeader = string.format([=[
        {| class="article-table" style="margin:1em auto;"
        |+ <small><span style="text-transform:uppercase; color:var(--positive-text-color);">Last updated: <span style="text-decoration:underline;">%s</span></span></small>
        ! style="text-align:center;" | Category
        ! style="text-align:left;"   | Count
        ! style="text-align:left;"   | [[File:ClanAffinity64.png|x26px|class=icon|link=]]Affinity
        |-
    ]=], argTable['ver'] and Version.getVersionLink(argTable['ver']) or 'N/A')

    local tRows = string.format([=[
        | [[Warframes]] || %d || %s
        |-
        | [[Weapons]] || %d || %s
        |-
        | [[Companions]] || %d || %s
        |-
        | [[Archwing]]s || %d || %s
        |-
        | [[Archgun]]s || %d || %s
        |-
        | [[Archmelee]]s || %d || %s
        |-
        | [[Pigment]]s || %d || %s
        |-
        | [[Research/Tenno Lab#Backdrops|Backdrops]] || %d || %s
        |-
        | [[Orbiter Segments]] || %d || %s
        |-
        | [[Resources]] || %d || %s
        |-
        | [[Gear]] || %d || %s
        |-
        | [[Equipment#Superchargers|Superchargers]] || %d || %s
        |-
        | [[K-Drive#Scrawl|K-Drive Scrawls]] || %d || %s
        |-
        | [[Decorations/DojoDecorations/Visitors|Visitors]] || %d || %s
        |-
        | [[Dojo#Rooms and Decorations|Rooms]] || %d || %s
        |-
        | [[Solar Rail (Dark Sectors)|Solar Rail]] Construction || %d || %s
        |-
        ]=],
        argTable['warframes'], Math.formatnum(9500 * (argTable['warframes'] - 1) + 4500), -- Yareli
        argTable['weapons'], Math.formatnum(3000 * (argTable['weapons'] - 6) + 36000), -- Hema, Lenz, Kreska, Ocucor, Battacor, Ghoulsaw
        argTable['companions'], Math.formatnum(3000 * argTable['companions']),
        argTable['archwings'], Math.formatnum(7500 * argTable['archwings']),
        argTable['archGuns'], Math.formatnum(3000 * (argTable['archGuns'] - 1) + 5000), -- Grattler
        argTable['archMelees'], Math.formatnum(3000 * (argTable['archMelees'] - 1) + 5000), -- Knux
        argTable['pigments'], Math.formatnum(1000 * argTable['pigments']),
        argTable['backdrops'], Math.formatnum(1000 * argTable['backdrops']),
        argTable['segments'], Math.formatnum(6000 * argTable['segments']),
        argTable['resources'], Math.formatnum(2000 * (argTable['resources'] - 1) + 3000), -- Synthula
        argTable['gear'], Math.formatnum(3000 * (argTable['gear'] - 1) + 2000), -- Infested Catalyst
        argTable['upgrades'], Math.formatnum(5000 * argTable['upgrades']),
        argTable['kdrive'], Math.formatnum(1500 * argTable['kdrive']),
        argTable['visitors'], Math.formatnum(1000 * argTable['visitors']),
        argTable['rooms'], Math.formatnum(10000 * (argTable['rooms'] - 4) + 60000), -- Temple, Dueling Room, Obstacle Course + Architect
        argTable['solarRail'], Math.formatnum(17000 * argTable['solarRail'])
    )

    local total = 0
    for argName, value in pairs(argTable) do
        if (argName ~= 'platform' and argName ~= 'ver') then
            total = total + value
        end
    end

    local totalXp = 9500*(argTable['warframes']-1) + 3000*((argTable['weapons']-6) + argTable['companions'] + (argTable['archGuns']-1)
        + (argTable['archMelees']-1) + (argTable['gear']-1)) + 7500*argTable['archwings'] + 1000*argTable['pigments'] + 1000*argTable['backdrops']
        + 6000*argTable['segments'] + 2000*(argTable['resources']-1) + 5000*argTable['upgrades'] + 1500*argTable['kdrive'] + 1000*argTable['visitors']
        + 10000*(argTable['rooms']-4) + 17000*argTable['solarRail']
        + 115500
    local clanRank = getClanRank(totalXp)
    local clanRankExclusive = getClanRank(totalXp - 17000)

    local tFooter = string.format([=[
        ! Total !! %d !! %s<ref>%s</ref>
        |-
        ! Minus Exclusives !! %d !! %s<ref>%s</ref>
        |-
        |}
        ]=],
        total, Math.formatnum(totalXp), clanRank,
        total - 1, Math.formatnum(totalXp - 17000), clanRankExclusive
    )

    return tHeader..tRows..tFooter
end

--- Builds total Clan affinity table.
--  @function       p.buildClanAffinityTable
--  @param          {table} frame
--  @return         {string} Resultant table in wikitext
function p.buildClanAffinityTable(frame)
    assert(frame and frame.args ~= nil, 'p.buildClanAffinityTable(frame): must pass the number of items in each category')
    return frame:preprocess(buildClanAffinityTable(frame.args))
end

return p
