---
title: "Module:Baro/data/doc"
wiki_url: "https://wiki.warframe.com/w/Module/Baro/data/doc"
wiki_timestamp: "2026-05-30T05:15:16Z"
---

Database contents initially seeded based on wikitables in [Baro\_Ki'Teer/Trades](/w/Baro_Ki%27Teer/Trades "Baro Ki'Teer/Trades") and [Baro\_Ki'Teer/ConsoleTrades](/w/Baro_Ki%27Teer/ConsoleTrades "Baro Ki'Teer/ConsoleTrades"). For full history see, [User:Anexera](/w/User:Anexera "User:Anexera")'s [Google Sheets](https://docs.google.com/spreadsheets/d/1cdT7M2qbOhZ01AQT2RaH8_6VL1yww4BHkTRtLzqZ7_g/edit#gid=632835097). See [Module:Baro/data/visits](/w/Module:Baro/data/visits "Module:Baro/data/visits") for Baro's historical visits.

:   *Last updated: Sat, 30 May 2026 05:15:16 +0000 (UTC) by [User:Cephalon Scientia](/w/User:Cephalon_Scientia "User:Cephalon Scientia") ([change log](https://wiki.warframe.com/w/Module:Baro/data/doc?diff=0))*

## Contents

* [1 Notes](#Notes)
* [2 Item Entry Schema](#Item_Entry_Schema)
* [3 Offerings Data](#Offerings_Data)

## Notes

[[edit source](/w/Module:Baro/data/doc?action=edit&section=1 "Edit section's source code: Notes")]

* ~~Console offerings are typically 3 visits (6 weeks) behind PC offerings; this note will be useful in validating this data~~ This is not true for Baro visits after 2022-07-29 because of <https://forums.warframe.com/topic/1318141-baro-ki%E2%80%99teer-cross-platform-inventory-sync-event/>.
* On [TennoCon](/w/TennoCon "TennoCon"), all previous offerings are made available; these dates are not noted and these visits are irregular in length (over 48 hours)
  + See [TennoCon](/w/TennoCon "TennoCon") for historical documentation
  + There are reported instances where there are missing items from Baro stock on the TennoCon relay:
    - <https://forums.warframe.com/topic/1316717-tennocon-2022-baro-missing-some-items-fixed/> ([Archived](https://web.archive.org/web/20220722191320/https://forums.warframe.com/topic/1316717-tennocon-2022-baro-missing-some-items-fixed/))
    - <https://forums.warframe.com/topic/1316717-tennocon-2022-baro-missing-some-items-fixed/page/2/> ([Archived](https://web.archive.org/web/20220722191455/https://forums.warframe.com/topic/1316717-tennocon-2022-baro-missing-some-items-fixed/page/2/))
    - <https://www.reddit.com/r/Warframe/comments/w5hjlg/less_than_24_hours_left_on_tennocon_baro_and_hes/>
    - "Quick update to inform everyone that the items Baro was missing will be added to his next 3 visits in the name of syncing his inventory on all platforms" - <https://forums.warframe.com/topic/1316717-tennocon-2022-baro-missing-some-items-investigating/?do=findComment&comment=12564680>
* Baro's first appearance was on 2014-12-12; from here one can calculate the Fridays in which Baro visits occur
* Baro skips 2019-07-13 appearance due to TennoCon 2019; this visit was moved to 2019-07-19 as per <https://forums.warframe.com/topic/1109278-all-platforms-baro-kiteer-regular-schedule-resumes-july-19/>
* Starting 2022-07-29, all platforms will have the same Baro offerings for parity and future cross-play. <https://forums.warframe.com/topic/1318141-baro-ki%E2%80%99teer-cross-platform-inventory-sync-event/>
* Baro visits weekly for the month of April 2025: <https://www.warframe.com/news/baro-kiteer-brings-bonus-visits-throughout-april>
  + April 4 at 9 a.m. ET - April 6 at 9 a.m. ET
  + BONUS WEEK | April 11 at 9 a.m. ET - April 13 at 9 a.m. ET
  + April 18 at 9 a.m. ET - April 20 at 9 a.m. ET
  + BONUS WEEK | April 25 at 9 a.m. ET - April 27 at 9 a.m. ET

## Item Entry Schema

[[edit source](/w/Module:Baro/data/doc?action=edit&section=2 "Edit section's source code: Item Entry Schema")]

```lua
	["Item name"] = {
		ConsoleOfferingDates = {
        	"2014-12-12",
        },
		CreditCost = 100000,
		DucatCost = 350,
		Image = "Panel.png",
		Link = "Article name",
		Name = "Item name",
		OfferingDates = {
			"2022-07-29",
		},
        PcOfferingDates = {
			"2014-12-12"
		},
		Type = "Mod (Primed)" 
	},
```

| Key/Column Name | Data Type | Required? | Explanation/Description | Example(s) |
| --- | --- | --- | --- | --- |
| `OfferingDates` | Table (array of strings) | ❌ | Starting dates (in UTC) of Baro appearances in which item was available to purchase on all platforms in ISO format "YYYY-mm-dd" and in ascending order. | `{ "2022-07-29", "2022-08-12", "2022-08-26" }` |
| `ConsoleOfferingDates` | Table (array of strings) | ❌ | Starting dates (in UTC) of Baro appearances in which item was available to purchase on consoles in ISO format "YYYY-mm-dd" and in ascending order. ⚠️ **Deprecated so do not use for new items because of 2022-07-29 platform parity. Use `OfferingDates` instead.** ⚠️ | `{ "2016-12-16", "2017-10-06", "2017-12-29", "2019-10-11" }` |
| `CreditCost` | Number (integer) | ✔️ | Cost of item in [Credits](/w/Credits "Credits") | `100000` |
| `DucatCost` | Number (integer) | ✔️ | Cost of item in [Ducats](/w/Ducats "Ducats") | `350` |
| `Image` | String | ✔️ | Image file name of the item as uploaded to the wiki | `"KiteerFireworks_512x342.png"` |
| `Link` | String | ✔️ | Page/article link to the item on the wiki | `"Armor (Cosmetic)"` |
| `Name` | String | ✔️ | Item name | `"Fass Floof"` |
| `PcOfferingDates` | Table (array of strings) | ❌ | Starting dates (in UTC) of Baro appearances in which item was available to purchase on PC in ISO format "YYYY-mm-dd" and in ascending order. ⚠️ **Deprecated so do not use for new items because of 2022-07-29 platform parity. Use `OfferingDates` instead.** ⚠️ | `{ "2016-11-04", "2017-08-25", "2017-12-29", "2019-08-30" }` |
| `Type` | String | ✔️ | Item type (e.g. "Mod (Primed)", "Consumable", "Cosmetic (Warframe Armor)") | `"Decoration"` |

## Offerings Data

[[edit source](/w/Module:Baro/data/doc?action=edit&section=3 "Edit section's source code: Offerings Data")]

