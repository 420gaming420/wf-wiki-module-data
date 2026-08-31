local AbilityData = {
	["Ability"] = {
	--Ash
		["Shuriken"] = {
			Cost = 25,
			Key = 1,
			Description = "Launchers a homing blade of pain, dealing Puncture Damage.",
		},
		["Smoke Screen"] = {
			Cost = 35,
			Key = 2,
			Description = "Drops a smoke bomb rendering Ash invisible for a short time. Invisibility is broken on firing any weapon or using any ability, picking up health/energy/ammo and taking damage.",
		},
		["Teleport"] = {
			Cost = 25,
			Key = 3,
			Description = "Ash teleports towards the target, bringing him into melee range.",
		},
		["Blade Storm"] = {
			Cost = 0,
			Key = 4,
			Description = "Project fierce shadow clones of Ash upon groups of distant enemies. Join the fray using Teleport.",
		},
	--Atlas
		["Landslide"] = {
			Cost = 25,
			Key = 1,
			Description = "Bash enemies with an exploding sliding punch, and repeat for a devastating combo. Petrified enemies take extra damage, and drop Rubble when destroyed. Rubble can heal Atlas and bolster his armor.",
		},
		["Tectonics"] = {
			Cost = 50,
			Key = 2,
			Description = "Summon a rock-wall, activate again to send the rocks crashing towards the enemy.",
		},
		["Petrify"] = {
			Cost = 75,
			Key = 3,
			Description = "Atlas' hardened gaze will fossilize foes, heal Rumblers, and create Petrified Bulwarks. When shattered, petrified enemies drop healing Rubble for Atlas.",
		},
		["Rumblers"] = {
			Cost = 100,
			Key = 4,
			Description = "Summon two elemental stone brawlers to the melee. Summoning petrifies enemies in close proximity to Atlas. When finished, Rumblers collapse into a pile of healing Rubble.",
		},
	--Banshee
		["Sonic Boom"] = {
			Cost = 25,
			Key = 1,
			Description = "Banshee emits a sonic shockwave that knocks down targets in range.",
		},
		["Sonar"] = {
			Cost = 50,
			Key = 2,
			Description = "Using acoustic location, Banshee's Sonar power finds and tracks enemies, and exposes critical weak spots to everyone in your squad.",
		},
		["Silence"] = {
			Cost = 75,
			Key = 3,
			Description = "Using Silence will cancel any active Abilities of opponents in range and won't allow them to cast for the duration.",
		},
		["Sound Quake"] = {
			Cost = 25,
			Key = 4,
			Description = "Channeling all of her acoustic energy into the environment, Banshee uses ultrasonic reverberations to violently shake the ground.",
		},
	--Chroma
		["Spectral Scream"] = {
			Cost = 10,
			Key = 1,
			Description = "Exhale a deep breath of elemental destruction. Chroma's energy color determines the element.",
		},
		["Elemental Ward"] = {
			Cost = 50,
			Key = 2,
			Description = "Depending on Chroma's elemental alignment, an offensive area-of-effect is created. Chroma and his nearby allies are imbued with defensive energy.",
		},
		["Vex Armor"] = {
			Cost = 75,
			Key = 3,
			Description = "When shields are hit, Chroma's armor grows stronger, when health takes a hit, weapon damage increases. Active for a limited time, maximum increases corresponding to rank.",
		},
		["Effigy"] = {
			Cost = 50,
			Key = 4,
			Description = "Chroma turns his pelt into a massive sentry that strengthens nearby allies and engulfs enemies in elemental attacks.",
		},
	--Ember
		["Fireball"] = {
			Cost = 25,
			Key = 1,
			Description = "Charge and release a fiery projectile that ignites enemies on contact and leaves behind a treacherous patch of flame.",
		},
		["Accelerant"] = {
			Cost = 50,
			Key = 2,
			Description = "Stun nearby enemies with strong accelerant. Increases all fire damage dealt.",
		},
		["Fire Blast"] = {
			Cost = 75,
			Key = 3,
			Description = "Slam the ground to create a wave of plasma that incinerates nearby enemies and forms a persistent ring of fire. Add heat damage to weapons by firing them through the ring.",
		},
		["World On Fire"] = {
			Cost = 50,
			Key = 4,
			Description = "Blast nearby foes with a burst of fire, and follow that up with a barrage of fireballs against any enemy who dares approach. Over time, these fireballs burn hotter as they consume more energy.",
		},
	--Equinox
		["Metamorphosis"] = {
			Cost = 25,
			Key = 1,
			Description = "Switch forms, temporarily gaining bonus shields and armor in Night-Form, or bonus damage and speed in Day-Form.",
		},
		["Rest & Rage"] = {
			Cost = 25,
			Key = 2,
			Description = "In Night Form targets are put to sleep. In Day Form targets become more vulnerable to damage.",
		},
		["Pacify & Provoke"] = {
			Cost = 10,
			Key = 3,
			Description = "In Night Form reduces damage inflicted by nearby enemies. In Day Form increases Ability Strength of nearby allies.",
		},
		["Mend & Maim"] = {
			Cost = 50,
			Key = 4,
			Description = "In Night Form, allies are healed with each nearby enemy killed. In Day Form, nearby enemies are bled and then subjected to a wave of slashing force.",
		},
	--Excalibur
		["Slash Dash"] = {
			Cost = 25,
			Key = 1,
			Description = "Dash between enemies while slashing with the Exalted Blade.",
		},
		["Radial Blind"] = {
			Cost = 50,
			Key = 2,
			Description = "Emits a bright flash of light, blinding all enemies in a small radius for several seconds.",
		},
		["Radial Javelin"] = {
			Cost = 75,
			Key = 3,
			Description = "Launches javelins towards enemies, dealing high damage and impaling them to walls.",
		},
		["Exalted Blade"] = {
			Cost = 25,
			Key = 4,
			Description = "Summon a sword of pure light and immense power.",
		},
	--Umbra's Radial Blind
		["Radial Howl"] = {
			Cost = 50,
			Key = 2,
			Description = "Let out a ferocious howl that stuns nearby enemies and causes Sentients to shed any built up resistances.",
		},
	--Frost
		["Freeze"] = {
			Cost = 25,
			Key = 1,
			Description = "A frigid energy blast that freezes targets in their tracks.",
		},
		["Ice Wave"] = {
			Cost = 50,
			Key = 2,
			Description = "Sends a wave of razor sharp, crystallized ice toward an enemy, dealing heavy damage.",
		},
		["Snow Globe"] = {
			Cost = 50,
			Key = 3,
			Description = "Frost deep freezes any vapor and moisture in the area, creating a protective sphere with brief invulnerability to boost its strength.",
		},
		["Avalanche"] = {
			Cost = 100,
			Key = 4,
			Description = "Summons a treacherous landslide of ice that instantly freezes and shatters all enemies in its radius.",
		},
	--Gara
		["Shattered Lash"] = {
			Cost = 25,
			Key = 1,
			Description = "Lash out with stream of shattered glass, or hold for an arcing strike.",
		},
		["Splinter Storm"] = {
			Cost = 50,
			Key = 2,
			Description = "Gara's armor splinters into a maelstrom of shattered glass that slices enemies and impairs their weapons. Allies who contact the cloud are fortified against damage.",
		},
		["Spectrorage"] = {
			Cost = 75,
			Key = 3,
			Description = "Trap enemies in a carousel of mirrors, forcing them to attack visions of their true selves. Destroyed mirrors damage their attackers, as does the collapse of the carousel.",
		},
		["Mass Vitrify"] = {
			Cost = 75,
			Key = 4,
			Description = "Create an expanding ring of molten glass that slowly crystallizes enemies who enter. When the expansion is complete, the ring hardens to block weapons fire. The ring draws extra strength from the health and shields of crystallized enemies. Use Shattered Lash to smash the ring and send razor-sharp glass flying outward.",
		},
	--Garuda
		["Dread Mirror"] = {
			Cost = 25,
			Key = 1,
			Description = "",
		},
		["Blood Altar"] = {
			Cost = 50,
			Key = 2,
			Description = "",
		},
		["Bloodletting"] = {
			Cost = 0,
			Key = 3,
			Description = "",
		},
		["Seeking Talons"] = {
			Cost = 100,
			Key = 4,
			Description = "",
		},
	--Harrow
		["Condemn"] = {
			Cost = 25,
			Key = 1,
			Description = "Cast a wave of energy that chains them where they stand. Each enemy held reinforces Harrow’s shields.",
		},
		["Penance"] = {
			Cost = 50,
			Key = 2,
			Description = "Sacrifice shields to boost reload, and fire rate while converting damage inflicted on enemies into health for Harrow and nearby allies.",
		},
		["Thurible"] = {
			Cost = 25,
			Key = 3,
			Description = "Channel Harrow’s energy into the Thurible to generate a buff. Once finished, kill enemies to bestow nearby allies with bursts of energy. The more energy channeled the greater the reward for each kill. Headshots produce extra energy.",
		},
		["Covenant"] = {
			Cost = 100,
			Key = 4,
			Description = "Protect nearby allies with an energy force that absorbs all damage and converts it to a Critical Chance bonus for all those under the Covenant. Headshots are amplified even further.",
		},
	--Hydroid
		["Tempest Barrage"] = {
			Cost = 25,
			Key = 1,
			Description = "Target an area and call down a barrage of liquid fury. Charge this attack to increase the lethality of the onslaught.",
		},
		["Tidal Surge"] = {
			Cost = 50,
			Key = 2,
			Description = "Crash through enemies in a ferocious wall of water.",
		},
		["Undertow"] = {
			Cost = 15,
			Key = 3,
			Description = "Become a water trap, opponents that come into contact will be knocked down if they attempt to jump.",
		},
		["Tentacle Swarm"] = {
			Cost = 50,
			Key = 4,
			Description = "Tap to spawn watery tentacles from all nearby surfaces to wreak havoc. Charge to increase the number of tentacles and spawn area. Use while in Undertow to have the tentacles emerge from the pool.",
		},
	--Inaros
		["Desiccation"] = {
			Cost = 25,
			Key = 1,
			Description = "Blast enemies with a wave of cursed sand that blinds them and steals their health.",
		},
		["Devour"] = {
			Cost = 50,
			Key = 2,
			Description = "Hold power to trap target in quicksand rendering them unable to jump. Killing an opponent trapped in Quicksand creates a sand pile that can be devoured for Health.",
		},
		["Sandstorm"] = {
			Cost = 75,
			Key = 3,
			Description = "Become an invulnerable whirling spiral of sand that knocks opponents down.",
		},
		["Scarab Swarm"] = {
			Cost = 25,
			Key = 4,
			Description = "Charge to transform health into hardened scarab armor. Discharge to blast enemies with a scarab swarm. Survivors have their health drained and bestowed on allies.",
		},
	--Ivara
		["Quiver"] = {
			Cost = 25,
			Key = 1,
			Description = "Cycle through and shoot one of three tactical arrows: Cloak, Null-Shield, and Encumbered Arrows.",
		},
		["Navigator"] = {
			Cost = 25,
			Key = 2,
			Description = "Assume control of a projectile and guide it to the target.",
		},
		["Prowl"] = {
			Cost = 25,
			Key = 3,
			Description = "Become invisible and take out opponents with deadly headshots.",
		},
		["Artemis Bow"] = {
			Cost = 50,
			Key = 4,
			Description = "Summon a mighty bow and unleash a volley of devastating arrows.",
		},
	--Khora
		["Whipclaw"] = {
			Cost = 25,
			Key = 1,
			Description = "Send enemies reeling with a deafening whipcrack.",
		},
		["Ensnare"] = {
			Cost = 50,
			Key = 2,
			Description = "Bind a hapless target in living metal, entangling others who stray too close. Whipclaw will refresh the trap allowing it to capture more enemies.",
		},
		["Venari"] = {
			Cost = 0,
			Key = 3,
			Description = "Command Venari to focus on a target. Hold to cycle between Attack, Protect, and Heal postures. If Venari is killed, use this ability to revive her instantly.",
		},
		["Strangledome"] = {
			Cost = 100,
			Key = 4,
			Description = "Weave a dome of living chain that ensnares and strangles any enemy within, and any foolish enough to approach. Foes outside the trap will try to hasten their comrade's deaths by shooting them. Crack Whipclaw on the dome to further damage any trapped enemies.",
		},
	--Limbo
		["Banish"] = {
			Cost = 25,
			Key = 1,
			Description = "Casts a wave of Rift energy that damages hostiles while pushing enemies and allies out of Limbo’s current plane of existence.",
		},
		["Stasis"] = {
			Cost = 50,
			Key = 2,
			Description = "Freezes Rift-bound enemies. While active, enemy projectiles are arrested in mid-air, resuming its trajectory when stasis ends.",
		},
		["Rift Surge"] = {
			Cost = 50,
			Key = 3,
			Description = "Surges nearby Rift-bound enemies with Rift energy. When killed the Rift Surge is transferred to a nearby enemy outside the rift. Surged enemies that leave the Rift perform a radial Banish.",
		},
		["Cataclysm"] = {
			Cost = 100,
			Key = 4,
			Description = "A violent blast of void energy tears open a pocket of rift plane which can sustain itself for a short period before collapsing in another lethal blast.",
		},
	--Loki
		["Decoy"] = {
			Cost = 25,
			Key = 1,
			Description = "Loki deploys a holographic copy of himself equipped with his Primary Weapon.",
		},
		["Invisibility"] = {
			Cost = 50,
			Key = 2,
			Description = "Loki camouflages himself, becoming invisible to enemies. Camouflage is broken on receiving or dealing damage.",
		},
		["Switch Teleport"] = {
			Cost = 25,
			Key = 3,
			Description = "Loki instantaneously swaps positions with a target, confusing the enemy.",
		},
		["Radial Disarm"] = {
			Cost = 100,
			Key = 4,
			Description = "Lets forth a wave of energy, forcing opponents to equip their Melee Weapons and depleting their energy.",
		},
	--Mag
		["Pull"] = {
			Cost = 25,
			Key = 1,
			Description = "Magnetic force staggers opponents and deals high damage to shields.",
		},
		["Magnetize"] = {
			Cost = 50,
			Key = 2,
			Description = "Creates a magnetic field around a target that attracts any weapon fire that hits it and deals damage over time.",
		},
		["Polarize"] = {
			Cost = 75,
			Key = 3,
			Description = "Emit an energy pulse that depletes enemy shields and adds it to Mag.",
		},
		["Crush"] = {
			Cost = 100,
			Key = 4,
			Description = "Magnetizes the bones of nearby enemies, causing them to collapse upon themselves.",
		},
	--Mesa
		["Ballistic Battery"] = {
			Cost = 25,
			Key = 1,
			Description = "When activated, this power stores damage caused by guns. When triggered again, that damage is channeled through the next gunshot.",
		},
		["Shooting Gallery"] = {
			Cost = 50,
			Key = 2,
			Description = "Removes ammo from opponent's clip and gives it to Mesa.",
		},
		["Shatter Shield"] = {
			Cost = 75,
			Key = 3,
			Description = "Envelops Mesa in a barrier of energy, reflecting back incoming bullet damage.",
		},
		["Peacemaker"] = {
			Cost = 25,
			Key = 4,
			Description = "With intense focus, Mesa draws her Regulator pistols, shooting down her foes in rapid succession.",
		},
	--Mirage
		["Hall Of Mirrors"] = {
			Cost = 25,
			Key = 1,
			Description = "Mirage creates an entourage of doppelgangers to confuse and distract the enemy.",
		},
		["Sleight Of Hand"] = {
			Cost = 50,
			Key = 2,
			Description = "Booby trap nearby objects while conjuring an irresistible jewel that bursts with radial blind when touched in darkness, or a radial explosion in light. Conjure multiple smaller jewels with the help of Hall of Mirrors.",
		},
		["Eclipse"] = {
			Cost = 25,
			Key = 3,
			Description = "Standing in light, Mirage deals heavy damage, while the shadows make Mirage difficult to track and even harder to hurt.",
		},
		["Prism"] = {
			Cost = 50,
			Key = 4,
			Description = "Fires an energy prism that shoots lasers in all directions. Activating again detonates the prism, blinding nearby foes.",
		},
	--Nekros
		["Soul Punch"] = {
			Cost = 25,
			Key = 1,
			Description = "A powerful blow that knocks down opponents.",
		},
		["Terrify"] = {
			Cost = 75,
			Key = 2,
			Description = "Casts fear into the hearts of nearby enemies, causing them to deal less damage.",
		},
		["Desecrate"] = {
			Cost = 10,
			Key = 3,
			Description = "Forces fallen enemies around you to drop a Health Orb and are also visible to Nekros on respawn.",
		},
		["Shadows Of The Dead"] = {
			Cost = 100,
			Key = 4,
			Description = "Reduces respawn timer of Nekros and his teammates to 0.",
		},
	--Nezha
		["Fire Walker"] = {
			Cost = 25,
			Key = 1,
			Description = "Blaze a trail of flames, increasing Movement Speed.",
		},
		["Blazing Chakram"] = {
			Cost = 25,
			Key = 2,
			Description = "Hurl a flaming ring that sets enemies ablaze making them vulnerable to any damage. Flaming enemies drop Restorative Orbs on death. Reactivate to instantly travel to the ring's location.",
		},
		["Warding Halo"] = {
			Cost = 75,
			Key = 3,
			Description = "Create a protective ring of fire that damages opponents who get too close.",
		},
		["Divine Spears"] = {
			Cost = 100,
			Key = 4,
			Description = "Impale nearby enemies on spears that erupt from the below. Activate again to slam surviving enemies back into the ground.",
		},
	--Nidus
		["Virulence"] = {
			Cost = 40,
			Key = 1,
			Description = "Rupture the ground with a damaging fungal growth that steals energy from each enemy it strikes. For every five enemies hit, the Infestation mutates, multiplying its destructive force.",
		},
		["Larva"] = {
			Cost = 25,
			Key = 2,
			Description = "Spawn an Infested pod that erupts with tendrils, latches onto nearby enemies and pulls them in.",
		},
		["Parasitic Link"] = {
			Cost = 0,
			Key = 3,
			Description = "Bind to a target with a parasitic link. For allies, both the host and Nidus deal increased damage. Linked enemies take the damage inflicted on Nidus.",
		},
		["Ravenous"] = {
			Cost = 0,
			Key = 4,
			Description = "Gluttonous maggots swarm nearby enemies, feasting until they are hit with Virulence burst with Infestation. The maggots benefit from Mutation and each enemy hit adds to the Mutation stack.",
		},
	--Nova
		["Null Star"] = {
			Cost = 25,
			Key = 1,
			Description = "Creates anti-matter particles that seek nearby opponents and remove their Energy.",
		},
		["Antimatter Drop"] = {
			Cost = 50,
			Key = 2,
			Description = "Launches a contained particle of antimatter that will detonate upon collision with increased deadliness when targeted by weapons.",
		},
		["Worm Hole"] = {
			Cost = 75,
			Key = 3,
			Description = "Creates a wormhole allowing instantaneous travel.",
		},
		["Molecular Prime"] = {
			Cost = 100,
			Key = 4,
			Description = "Primes all enemies in a radius with volatile anti-matter.",
		},
	--Nyx
		["Mind Control"] = {
			Cost = 25,
			Key = 1,
			Description = "Nyx invades the psyche of a target, making opponents appear as teammates and teammates as opponents. Target also cannot damage Nyx.",
		},
		["Psychic Bolts"] = {
			Cost = 50,
			Key = 2,
			Description = "Nyx launches a cluster of force bolts at enemies, using telekinesis to adjust flight paths and seek nearby targets.",
		},
		["Chaos"] = {
			Cost = 75,
			Key = 3,
			Description = "With a powerful psychic blast, Nyx causes all affected to see other player as opponents and can damage/kill their teammates.",
		},
		["Absorb"] = {
			Cost = 25,
			Key = 4,
			Description = "Nyx absorbs all incoming damage and channels that collected energy into an explosive radial discharge.",
		},
	--Oberon
		["Smite"] = {
			Cost = 25,
			Key = 1,
			Description = "Focuses deadly energy within a target and then projects it outwards, damaging both the target and surrounding enemies.",
		},
		["Hallowed Ground"] = {
			Cost = 50,
			Key = 2,
			Description = "Sanctifies the ground before Oberon with righteous fire, inflicting damage to any enemy that stands in the flames.",
		},
		["Renewal"] = {
			Cost = 25,
			Key = 3,
			Description = "Healing waves of energy flow outward from Oberon to his allies, regenerating health over time.",
		},
		["Reckoning"] = {
			Cost = 100,
			Key = 4,
			Description = "Quickly lifts enemies into the air and then hurls them down with conviction. Enemies who succumb to this power have a chance to spawn a Health Sphere.",
		},
	--Octavia
		["Mallet"] = {
			Cost = 25,
			Key = 1,
			Description = "Rhythmically beats damage into nearby enemies and draws their fire. Damage inflicted on the Mallet increases its lethality.",
		},
		["Resonator"] = {
			Cost = 50,
			Key = 2,
			Description = "Launches a rollerball that charms foes to follow it. Combines with the Mallet to create a roving ball of sonic destruction.",
		},
		["Metronome"] = {
			Cost = 75,
			Key = 3,
			Description = "Grants buffs to those who consistently perform actions in time to Octavia’s music. Timed jumps offer the Vivace speed buff. Crouching on the beat grants cloaking with the Nocturne buff. Firing rhythmically bestows Opera multishot buff. Timed melee swings give the Forte damage buff.",
		},
		["Amp"] = {
			Cost = 100,
			Key = 4,
			Description = "Draws power from the decibel level of sound in the area and uses it to amplify a damage buff for Octavia and her allies. It also doubles the damage and range of nearby Mallets.",
			Link = "",
		},
	--Revenant
		["Enthrall"] = {
			Cost = 25,
			Key = 1,
			Description = "",
		},
		["Mesmer Skin"] = {
			Cost = 50,
			Key = 2,
			Description = "",
		},
		["Reave"] = {
			Cost = 50,
			Key = 3,
			Description = "",
		},
		["Danse Macabre"] = {
			Cost = 25,
			Key = 4,
			Description = "",
		},
	--Rhino
		["Rhino Charge"] = {
			Cost = 25,
			Key = 1,
			Description = "Rhino charges towards a target, clobbering any in his path and goring his victim.",
		},
		["Iron Skin"] = {
			Cost = 50,
			Key = 2,
			Description = "Rhino hardens his skin, insulating himself from all damage.",
		},
		["Roar"] = {
			Cost = 75,
			Key = 3,
			Description = "Grants all nearby Warframes increased damage for a short duration.",
		},
		["Rhino Stomp"] = {
			Cost = 100,
			Key = 4,
			Description = "Rhino stomps with force sufficient to disrupt time, slowing all opponents around him.",
		},
	--Saryn
		["Spores"] = {
			Cost = 25,
			Key = 1,
			Description = "Inflicts opponents with Viral damage over time.",
		},
		["Molt"] = {
			Cost = 50,
			Key = 2,
			Description = "Shedding her skin like a snake, Saryn leaves a decoy behind that attracts nearby weapon fire.",
		},
		["Toxic Lash"] = {
			Cost = 50,
			Key = 3,
			Description = "Increase ranged and melee damage.",
		},
		["Miasma"] = {
			Cost = 75,
			Key = 4,
			Description = "Releases a poisonous miasma that deals Viral damage to enemies in range. Foes afflicted by spores are more susceptible to the mist.",
		},
	--Titania
		["Spellbind"] = {
			Cost = 25,
			Key = 1,
			Description = "Opponents are forced to equip their Melee Weapons, nearby allies become immune to Status Effects.",
		},
		["Tribute"] = {
			Cost = 50,
			Key = 2,
			Description = "Staggers opponents and reduces their damage.",
		},
		["Lantern"] = {
			Cost = 75,
			Key = 3,
			Description = "Create a swarm of razorflies that lifts an opponent into the air and eventually explode. Damaging suspended targets will end the suspension prematurely and drop the target without dealing any damage.",
		},
		["Razorwing"] = {
			Cost = 25,
			Key = 4,
			Description = "Shrink down and take flight, while razorflies attack nearby enemies.",
		},
	--Trinity
		["Well Of Life"] = {
			Cost = 25,
			Key = 1,
			Description = "Create a well of life on an enemy. Allies will gain health when damaging the target.",
		},
		["Energy Vampire"] = {
			Cost = 50,
			Key = 2,
			Description = "Allies will gain energy over time when enemies are marked with Energy Vampire.",
		},
		["Link"] = {
			Cost = 75,
			Key = 3,
			Description = "Any damage taken while Link is active will be channeled to a nearby enemy.",
		},
		["Blessing"] = {
			Cost = 100,
			Key = 4,
			Description = "Restore the health and shields of allies within Trinity's Affinity aura while giving them some damage resistance.",
		},
	--Valkyr
		["Rip Line"] = {
			Cost = 25,
			Key = 1,
			Description = "Valkyr hurls forth a hook. If it hits an opponent, they are knocked down and damaged. If it hits terrain, she pulls herself to the hook's location.",
		},
		["Warcry"] = {
			Cost = 75,
			Key = 2,
			Description = "Valkyr lets out a rallying cry that bolsters her allies melee speed while slowing down nearby enemies.",
		},
		["Paralysis"] = {
			Cost = 5,
			Key = 3,
			Description = "Valkyr unleashes her shields, stunning and damaging enemies around her.",
		},
		["Hysteria"] = {
			Cost = 25,
			Key = 4,
			Description = "Valkyr is imbued with energy and becomes a ball of vicious rage, capable of unleashing a torrent of deadly claw attacks on unsuspecting foes.",
		},
	--Vauban
		["Tesla"] = {
			Cost = 25,
			Key = 1,
			Description = "Launches a grenade that holds an electrical charge, zapping enemies that come within range.",
		},
		["Minelayer"] = {
			Cost = 50,
			Key = 2,
			Description = "Cycle through four deployable trap mines: Bounce, Trip Laser, Shred and Concuss.",
		},
		["Bastille"] = {
			Cost = 75,
			Key = 3,
			Description = "Creates an energy-based containment field that slows down any opponents who enter.",
		},
		["Vortex"] = {
			Cost = 100,
			Key = 4,
			Description = "Creates a whirling mass of energy that knocks down and damages nearby opponents.",
		},
	--Volt
		["Shock"] = {
			Cost = 25,
			Key = 1,
			Description = "Launches a shocking projectile. It stuns and deals high damage to a single target and chains damage to nearby enemies.",
		},
		["Speed"] = {
			Cost = 25,
			Key = 2,
			Description = "Gain a brief boost of movement and and Melee attack speed.",
		},
		["Electric Shield"] = {
			Cost = 50,
			Key = 3,
			Description = "Volt deploys an obstacle of energy, providing cover in any situation.",
		},
		["Discharge"] = {
			Cost = 100,
			Key = 4,
			Description = "Paralyze nearby hostiles with a damaging electric charge, this also shocks approaching enemies.",
		},
	--Wukong
		["Iron Jab"] = {
			Cost = 25,
			Key = 1,
			Description = "Explode the Iron Staff to its true length, knocking down anything in its path.",
		},
		["Defy"] = {
			Cost = 50,
			Key = 2,
			Description = "Escape death by receiving a boost of health when killed.",
		},
		["Cloud Walker"] = {
			Cost = 25,
			Key = 3,
			Description = "Evaporate into a cloud of mist and float through the battlefield.",
		},
		["Primal Fury"] = {
			Cost = 25,
			Key = 4,
			Description = "Summon the Iron Staff and unleash fury.",
		},
	--Zephyr
		["Tail Wind"] = {
			Cost = 25,
			Key = 1,
			Description = "From the ground, charge and release to launch Zephyr into an airborne hover. From the air, tap to dash forward, or aim down to dive bomb enemies below.",
		},
		["Airburst"] = {
			Cost = 50,
			Key = 2,
			Description = "Generate a burst of massively dense air that explodes on contact and sends enemies flying. Launch Airbursts into Tornadoes to make them grow.",
		},
		["Turbulence"] = {
			Cost = 75,
			Key = 3,
			Description = "Creates a wind shield around Zephyr, redirecting all incoming projectiles.",
		},
		["Tornado"] = {
			Cost = 100,
			Key = 4,
			Description = "Create deadly tornadoes that seek out and engulf enemies. Tornadoes deal the elemental damage type they absorb the most. Shoot enemies engulfed in Tornadoes to do additional damage.",
		},
	},
}

return AbilityData
