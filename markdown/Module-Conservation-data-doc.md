---
title: "Module:Conservation/data/doc"
wiki_url: "https://wiki.warframe.com/w/Module/Conservation/data/doc"
wiki_timestamp: "2026-01-17T07:03:45Z"
---

## Contents

* [1 Animal Entry Schema](#Animal_Entry_Schema)
* [2 Conservation Data](#Conservation_Data)

Hey! You! Here to update something that's out of date? Follow these easy steps:

1. Use `CTRL+F` to find the data for the animal
2. Find the thing that's wrong
3. Change the thing and save the page

That's it! After you've done that, the data will proliferate out to all the relevant pages.

If you're adding new data instead of just changing existing data, try to use an example of how things are entered if you're not quite sure what to do.

(Oh, order doesn't matter, but spelling and capitalization do. For example, it doesn't matter if Disposition is first or last)

Thanks, you're awesome!

:   *Last updated: Sat, 17 Jan 2026 07:03:45 +0000 (UTC) by [User:Cephalon Scientia](/w/User:Cephalon_Scientia "User:Cephalon Scientia") ([change log](https://wiki.warframe.com/w/Module:Conservation/data/doc?diff=0))*

## Animal Entry Schema

[[edit source](/w/Module:Conservation/data/doc?action=edit&section=1 "Edit section's source code: Animal Entry Schema")]

```lua
["Animal Name"] = {
    Family = "Species Name",
    Introduced = "29.0",
    Codex = "A shy, bizarre-looking, semi-aquatic creature that seldom attacks unless provoked.",
    CodexScans = 20,
    Quotes = {
    	Quote1 = { 
            Quote = "A Quote about the animal.",
            Quotee = "A Guy"
        },
    	Quote2 = { 
            Quote = "A second Quote about the animal.",
            Quotee = "Another Guy"
        }
    },
    Image ="UmberUndazoa.png",
    Call = "PobberCall.ogg",
    Intro = "A Text shown above the Table of Rewards. Used to emphasis important Quirks of the Animal",
    Notes = "A Text shown below the Table of Rewards. Used to show minor Quirks of the Animal.",
    Reward = "The Main Reward you get, usually a specific standing",
    Standing = "How much standing you get for a bad capture",
    MinWeight = "1 kg",
    MaxWeight = "1000 kg",
    MinAge = { Month = 3, Year = 0 },
    MaxAge = { Month = 11, Year = 50},
    Origin = "Cambion Drift",
    Faction = "Prey"
}
```

| Key/Column Name | Data Type | Required? | Explanation/Description | Example(s) |
| --- | --- | --- | --- | --- |
| `Armor` | Number (integer) | ✔️ | [Armor](/w/Armor "Armor") value of animal | `50` |
| `Call` | String | ✔️ | The file name of the call of the animal as stored on the wiki | `"PobberCall.ogg"` |
| `Codex` | String | ✔️ | The [Codex](/w/Codex "Codex") entry of the animal | `"A shy, bizarre-looking, semi-aquatic creature that seldom attacks unless provoked."` |
| `CodexScans` | Number (integer) | ✔️ | The number of Codex scans needed to complete its entry | `20` |
| `Faction` | String | ✔️ | The faction, specified in the Codex entry of the animal | `"Prey"` |
| `Family` | String | ✔️ | Name of the species | `"Pobber"` or `"Vulpaphyla"` |
| `Health` | Number (integer) | ✔️ | [Health](/w/Health "Health") value of animal | `1` |
| `Introduced` | String | ✔️ | The version-number the animal got introduced | `"30.5"` or `"Specters Of The Rail"` |
| `Image` | String | ✔️ | The file name of the image of the animal as stored on the wiki | `"CommonPobber.png"` |
| `Intro` | String | ✔️ | Text displayed above the reward table used to emphasis important details | `"Only appears during Fass"` |
| `MaxAge` | Table | ✔️ | The maximum age of the animal in years and months stored as a table with key/value pairs | `{ Month = 0, Year = 30 }` |
| `MaxWeight` | Number (float) | ✔️ | The maximum weight of the animal in kg | `60.0` |
| `MinAge` | Table | ✔️ | The minimum age of the animal in years and months stored as a table with key/value pairs | `{ Month = 10, Year = 0 }` |
| `MinWeight` | Number (float) | ✔️ | The minimum weight of the animal in kg | `1.0` |
| `Notes` | String | ❌ | Trivia or not so important notes about the animal | `"Closely resembles the Jerboa"` |
| `Rarity` | String | ✔️ | Integer that represents rarity of animal ("Common", "Uncommon", "Rare") | `"Common"` |
| `Reward` | String | ✔️ | The most important type of reward you get for capturing the animal | `"Ostron Standing"` |
| `Standing` | Number (integer) | ✔️ | The amount of the type of standing specified for getting a '**bad'** capture ('Good' and 'Perfect' captures scales 1.5x and 2x respectively) | `500` or `0` |
| `Origin` | String | ✔️ | The origin of the animal | `"Cambion Drift"` |
| `Quotes` | Table (map of strings) | ❌ | A table of quotes with the quotee | `{ Quote = "this is a quote" Quotee = "myself" }` |
| `TranqsNeeded` | Number (integer) | ✔️ | Number of [Tranq Rifle](/w/Tranq_Rifle "Tranq Rifle") shots to subdue the animal for capture | `2` |

## Conservation Data

[[edit source](/w/Module:Conservation/data/doc?action=edit&section=2 "Edit section's source code: Conservation Data")]

