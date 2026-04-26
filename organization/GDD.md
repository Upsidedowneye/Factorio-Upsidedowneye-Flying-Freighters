
Stations marked for deconstruction are treated as unavailable, so freighters will not load from them, unload into them, or use them for fuel/ammo/trash service until the deconstruction mark is removed.
# Flying Freighters - Current-State GDD

## 1. Purpose

`upsidedowneye-flying-freighters` is currently a late-game scripted logistics mod that adds:

- a large **Flying Freighter Station** entity used as a configurable stop,
- a **Flying Freighter** vehicle entity that automatically moves cargo between stops,
- a signal-based route system that behaves somewhere between trains and logistic bots.

The current implementation is closer to a playable vertical slice than a finished feature-complete logistics system. The code already supports automated pickup, delivery, refueling, ammo resupply, trash dumping, route editing, blueprint persistence for stations and freighters, and basic compatibility hooks for Rampant Arsenal style capsule ammo.

The mod now also ships its own Tips and Tricks entries so newly unlocked players get in-game onboarding for the basic freighter workflow, station setup, route planning, and the late-game passive-provider station upgrade. It also adds a first-placement achievement for the first [entity=flying-freighter] a player builds, with a custom purple retint of the vanilla `arachnophilia` badge art. The runtime also now broadcasts a one-time-per-player, per-save chat message asking for improved sprite contributions through the mod portal discussion page so art help can be folded back into the mod. The station GUI still exposes the planned complex demand-request mode only as a greyed-out work in progress, and the current public build intentionally keeps demand stops on the simpler drop-off behavior until that later update is finished.

The first public release is now being packaged as version `0.9.0` rather than `1.0.0`, and the repo now includes a Factorio changelog plus a rough mod portal page draft to support that release process.

The current locale coverage now includes English, German, French, Spanish, Russian, Japanese, Simplified Chinese, and Dutch for the mod's items, entities, recipes, technologies, achievement text, Tips and Tricks text, settings, GUI strings, warnings, and reserved circuit-signal labels.

This document reflects what the mod **currently contains in code**, not the ideal final design.

## 2. High-Level Fantasy

The intended player fantasy already visible in the implementation is:

- build large dedicated air freight stops,
- tag each stop with an item/fluid/virtual signal and a role,
- assign a freighter an ordered multi-leg schedule of source/destination signal pairs,
- let the freighter automatically claim a viable route for the active leg, load real cargo from a source stop, travel across the map, unload at a demand stop, then continue to the next leg,
- keep the freighter supplied with burner fuel and combat capsule ammo via specially marked resupply stops.

In practice, the system currently feels like a **scripted long-haul shuttle network** rather than a fully generalized logistics network.

## 3. Current Content Summary

### 3.1 New entities and items

The mod currently defines two placeable entities:

- Static shared identifiers for station companion entities, reserved circuit signals, station power defaults, and custom input names are now centralized in a shared Lua constants module consumed by both `control.lua` and the data-stage prototype builder so those prototype/runtime names cannot silently drift apart during refactors.
- The Space Age startup-lock metadata is now also centralized in `shared/startup-settings.lua`, so the settings stage and prototype stage both read the same setting names, defaults, and display ordering instead of duplicating that configuration in two places.

#### Flying Freighter Station

- Based on a visible `container` with a hidden companion `electric-energy-interface` power entity.
- Uses a static purple-tinted Space Age cargo landing pad layer stack when available, scaled up by roughly `1.25` tiles for a chunkier station silhouette and shifted another half tile downward, with a tinted roboport-style fallback when that prototype is unavailable.
- Has `2500` health.
- Stores cargo directly in the visible station's `480` slot container inventory so inserters and loaders can interact with the station through the engine's normal container handling.
- Its placeable item explicitly uses `weight = 50000`, so Space Age rockets can carry exactly `20` standard stations per launch; the passive-provider station item uses that same rocket capacity.
- Spawns a hidden temporary `electric-energy-interface` only while a cargo, unload, resupply, or trash transfer is actively charging; that helper draws at up to `10MW` by default with assembler/furnace-style priority (`secondary-input`), sets the EEI prototype input-flow cap to that same default charge-rate ceiling, and is destroyed as soon as the transfer either completes or is canceled.
- Supports a per-station charge-rate override in the custom station GUI, stored in megawatts and preserved through copy-paste and blueprints; under the current temporary-EEI implementation that override is enforced up to the default prototype charging ceiling, with higher values clamped to that ceiling.
- Supports a per-station integer network ID in the custom station GUI; stations only auto-link to other stations on the same network, with `0` as the default network, and the setting is preserved through ghosts, copy-paste, and blueprints.
- Adds a startup hard mode that gives each freighter its own saved integer network ID in the freighter GUI; while enabled, freighters only interact with stations on that same network, and each station's per-transfer energy spend becomes the square of the number of freighters assigned to that network in MJ.
- Supports a per-station integer priority override in the custom station GUI, stored on station settings tags and preserved through ghosts, copy-paste, and blueprints.
- Supports a per-station non-negative Supply buffer count in the custom station GUI; Supply stops can reserve that many empty load freighters to pre-position there in advance while waiting for future stock, and the setting is preserved through ghosts, copy-paste, and blueprints.
- Supports stop-specific circuit-network integration on the visible station container: the station uses Factorio's native chest circuit settings for normal inventory readout, can switch between Supply and Demand from a selected signed signal (positive = Supply, negative = Demand), can accept live priority and network-ID overrides from selected signals, and always publishes the current active transfer's accumulated charge in whole megajoules on a selected output signal through a hidden companion combinator.
- The temporary EEI tracks transfer progress by accumulating real energy from the electric network at the station's configured rate. The prototype's input-flow limit now fixes the maximum charging ceiling, while runtime EEI power usage burns any unused portion of that ceiling so lower per-station charge-rate overrides still slow charging correctly. Partial-power ticks therefore carry forward automatically: if the network only feeds part of the requested wattage this tick, the transfer simply finishes later instead of snapping between empty/full battery behavior.
- Spends `100MJ` per transfer in the default rules, but only after that much energy has actually been absorbed by the active temporary EEI.
- Keeps the power entity hidden and non-operable while the visible station remains the actual cargo container, so opening the station stays on the normal inventory path instead of exposing EEI controls.
- When a station is mined, destroyed, or otherwise removed, the mod now explicitly sweeps the tile for any hidden cargo/power/circuit helper companions so invisible leftover helper entities do not remain behind.
- When a station record is rebuilt on load or runtime rescan, the script now also collapses any duplicate hidden cargo/power/circuit helper stack back down to one helper per prototype and rebinds the record to that survivor, which prevents old saves from accumulating thousands of renderable `empty.png` helper sprites at one stop.
- Is configured through the mod's own station GUI after selecting the station, using the left-side `Configure flying freighter` button or the `Shift+F` config hotkey; that access still works while the hidden cargo window is open because the mod preserves the station context through the cargo handoff.
- For built stations, the reserved Flying Freighters circuit controls now render in their own relative panel anchored to the right side of the vanilla container GUI, so they sit in the side column next to the inventory where the normal circuit/info UI appears.
- That panel stays tied to the currently opened station inventory while the window is open, and it now resolves that open-station context before any hover or selection state.
- That side panel is only shown when the built station is actually connected to a red or green circuit wire; the hidden internal FF energy-output combinator link does not count for visibility.
- Station ghosts now expose the same circuit-type toggle and signal pickers in a Flying Freighters side panel anchored beside Factorio's native ghost picker GUI, so the custom ghost popup no longer duplicates those circuit controls.
- Pressing the `Shift+F` config hotkey with nothing relevant selected now fails quietly instead of printing a chat warning, and the mod warns players that any other flip binding already using `Shift+F` must be rebound or flips will not work properly.
- Station ghosts can also be configured before construction through that same custom GUI, and their chosen settings are stored directly on the ghost tags; stop settings copy-paste also works between built stops and station ghosts.
- The station config GUI now uses Factorio's green confirm-style Save button, and pressing the GUI confirm hotkey (`E`) follows the same save-and-exit path as clicking that button so the confirm sound/UI behavior stays consistent.
- Adds a per-player runtime setting named `ff-force-gui-hotkey-usage` that can turn matching Flying Freighters GUI actions into hotkey-only controls for that player without affecting anyone else in the same save.
- When that per-player mode is enabled, built-station config screens disable the clickable Type/Fuel/Ammo/Trash/Save controls and show a hotkey-only hint, while station-ghost screens only force the shared confirm/save action because they do not support the station toggle hotkeys.
- Uses a large footprint: roughly `8x8` tiles of selection area.
- Migrates legacy hidden cargo companion contents into the visible station inventory the next time an older save loads after this change.
- Is used as the main scripted logistics stop.
- Has an in-game Tips and Tricks page that explains route signals, supply vs demand behavior, service-stop toggles, network IDs, and circuit-driven overrides.
- Still shows the unfinished complex demand-request control in the station GUI as a disabled greyed-out checkbox with a work-in-progress note so the planned feature remains visible, but the current public build forces all demand stations to use the simple drop-off behavior until a later update completes the richer request-target system.

#### Passive Provider Freighter Station

- Based on a `logistic-container` passive-provider chest so it participates in the vanilla logistics network as a passive provider while also acting as a Flying Freighter station.
- Reuses the same large freighter-station footprint, power-buffer behavior, and station GUI/settings model as the standard Flying Freighter Station, but retints the large station visuals and icon red so it is easy to distinguish from the standard purple station without layering an extra chest icon over the station icon.
- Can be targeted by freighter schedules, blueprint settings, copy-paste settings, and map/config GUIs exactly like the normal station.
- Is intended as a late/post-late-game hybrid stop for bases that want logistic bots and freighters to share the same provider inventory.
- Has its own in-game Tips and Tricks page explaining that it shares inventory with the vanilla passive-provider logistic network while still behaving like a Flying Freighter stop.

#### Flying Freighter

- Based primarily on `spidertron` when available, otherwise falls back to `tank`.
- Uses purple-tinted spidertron iconography and masked animation layers for its in-world appearance.
- Uses a purple-tinted spidertron icon for its item and technology visuals.
- Has `3000` health.
- Has `120` cargo inventory slots.
- Its placeable item explicitly uses `weight = 200000`, so Space Age rockets can carry exactly `5` freighters per launch.
- Uses burner fuel, not electric energy.
- Freighters now emit a throttled chat warning when automatic refueling deadlocks because the next dispatch leg costs more fuel than is currently available, the freighter is carrying old burner fuel that no powered fuel stop on its current service network provides, the cargo inventory has no room to stage that old fuel out of the burner slots, and no powered Trash stop is available to dump it.
- Is configured as an automated-only transport vehicle.
- Freighter ghosts can also be configured before construction through the same custom GUI, with their full ordered schedule stored directly on the ghost tags.
- Freighter config screens, including the map chooser variant, now also use the green confirm-style Save button, and the GUI confirm hotkey (`E`) reuses the same save-and-exit path as the button.
- That same per-player hotkey-only setting also disables the clickable Save button on freighter and map-route config screens and leaves the existing `E` confirm hotkey as the supported way to commit those screens while the setting is on.
- Uses default spidertron-style movement behavior again when the spidertron base prototype is available.
- Uses a hidden/stripped-down spider leg setup so it can use spider vehicle behavior without looking like a normal spidertron.
- Its hidden spider locomotion leg now suppresses the normal leg-hit smoke puff, zeros the inherited spider-leg walking sound modifiers that still drive tile-specific step audio, and plays a packaged wing-flap sound instead of spidertron footstep audio, so airborne motion no longer throws ground-footstep particles or metallic/surface-step sounds.
- Its inherited spider-vehicle chassis working sound is also replaced with that same packaged wing-flap clip, so the movement audio players actually hear during travel no longer falls back to spidertron's default vox loop.
- Has in-game Tips and Tricks pages that explain the basic unlock flow, station pairing, schedule setup, minimum-load behavior, and optional fuel/ammo/trash interrupts for new players.
- Awards the `flying-freighter-first-flight` achievement the first time a player places a real `flying-freighter`, using a data-stage `build-entity-achievement` so no runtime script tracking is needed, and displays it with a custom purple retint of the vanilla `arachnophilia` achievement icon.
- Broadcasts a save-scoped chat notice the first time each player joins that save, asking interested artists to post improved sprite work on the mod portal discussion page for possible inclusion in the mod.
- Can equip a compatible gun automatically if one of these prototypes exists:
	- `mortar-gun-rampant-arsenal`
	- `capsule-launcher-gun-rampant-arsenal`
	- `rocket-launcher`
	- `tank-cannon`

### 3.2 Recipes and technology

The mod currently adds:

- `flying-freighter-station` recipe
- `flying-freighter-station-nuclear` recipe
- `flying-freighter-passive-provider-station` recipe
- `flying-freighter` recipe
- `flying-freighters` technology
- `flying-freighter-passive-provider-stations` technology

Current progression:

- Tech prerequisite chain is currently based on `production-science-pack`.
- Without Space Age, research cost is `300` packs using automation, logistic, chemical, and production science.
- With Space Age enabled, the technology instead costs `1000` packs using automation, logistic, chemical, production, and space science by default, then conditionally adds planet science packs from the enabled locks.
- Three startup settings now control progression: Gleba is enabled by default, while Fulgora and Vulcanus are disabled by default.
- One runtime-global map setting now controls the starter burner fuel loaded into newly built or revived freighters, defaulting to `coal` and allowing `none` for empty starts.
- Those startup settings are read directly from their stored boolean values, so explicitly disabling a lock no longer falls back to the default by mistake.
- Demand behavior is now controlled per station with a station-GUI checkbox that defaults to off, so simple "accept anything insertable" dropoff behavior is the default and only stations explicitly opted in keep using precise request manifests.
- With the default startup settings, the Space Age branch adds `agricultural-science-pack` and requires the `carbon-fiber` technology, which keeps Flying Freighters in Gleba's progression by default.
- If all three startup planet locks are disabled, the Space Age branch falls back to requiring `utility-science-pack` so the technology still stays behind yellow science.
- If the Gleba lock is disabled, the Space Age branch no longer adds `agricultural-science-pack`, so turning that setting off actually removes the post-Gleba science requirement.
- If the Fulgora lock is enabled, the technology also requires `electromagnetic-plant` and adds `electromagnetic-science-pack` to the research cost.
- If the Vulcanus lock is enabled, the technology also adds `metallurgic-science-pack` to the research cost.
- The `flying-freighters` technology icon is a purple-tinted spidertron.
- The passive-provider station upgrade is split into its own follow-up technology so the base station/freighter system can stay earlier than the logistics-network hybrid variant.
- In base game, that upgrade currently costs `1000` research cycles using automation, logistic, chemical, production, and utility science, with `logistic-system` and `flying-freighters` as prerequisites.
- In Space Age, that upgrade currently changes to a `10000`-cycle research that uses automation, logistic, chemical, production, utility, space, agricultural, electromagnetic, metallurgic, and cryogenic science, and it explicitly requires the matching science-pack technologies alongside `flying-freighters` and `logistic-system`.
- This places the feature in roughly a **mid/late game** position in vanilla and lets Space Age saves push it behind whichever late-planet milestones the startup settings demand.

Current recipe material notes:

- The base station recipes use `stone-brick` in place of `iron-gear-wheel`.
- The passive-provider station recipe is now a direct upgrade: one normal Flying Freighter Station plus one passive provider chest.
- The freighter recipe also uses `stone-brick` in place of `iron-gear-wheel`.
- With Space Age enabled, the freighter recipe now conditionally adds `carbon-fiber`, `supercapacitor`, and/or `tungsten-plate` depending on the three startup planet-lock toggles.

## 4. Core Logistics Model

### 4.1 Stops are signal keyed

Every station can be assigned a **route signal** using a signal picker in the GUI. The route signal may be:

- an item signal,
- a fluid signal,
- a virtual signal,
- or an entity signal.

Internally this signal becomes the station's route key. Quality-bearing item route signals now preserve their selected quality through station settings, ghosts, blueprints, copy-paste, and normalized route keys instead of collapsing back to normal quality. Generated station names, chart tags, and other plain-text stop labels now also keep a compact raw quality suffix such as `iron-plate [legendary]`, so saving/reopening a station does not throw away the chosen quality even when older recovery paths have to reconstruct the route signal from the saved stop name. The mod also tries to migrate older/legacy naming formats by parsing old stop names and stored fields into a normalized signal ID.

Each station also has a numeric **network ID**. Stations only form automated source/destination links when both stops share the same network ID, so otherwise-identical routes on network `0` stay isolated from network `69` or any other network.

Stops now have a dedicated circuit-control layer that does not reuse the route-key picker itself:

- a GUI toggle can make the stop's effective type follow a selected signed signal, where positive values mean Supply and negative values mean Demand,
- a selected signal can override the saved stop priority while present,
- a selected signal can override the saved network ID while present,
- a selected signal always carries the stop's current active-transfer charge in whole megajoules,
- and normal inventory readout remains entirely on Factorio's native chest circuit settings.

For built stops, the saved circuit toggle and the four signal pickers now live in a dedicated Flying Freighters panel attached to the right side of the vanilla container GUI, and that panel is hidden entirely until the stop has a real red or green wire connection; station ghosts expose the same controls in a matching Flying Freighters side panel anchored beside Factorio's native ghost picker GUI, with the custom popup kept for the remaining stop settings.

If the signed station-type control signal is zero or absent, or if any other override signal is absent, the stop falls back to its saved GUI setting.

### 4.2 Stops have a role

Each station currently has one of two route roles:

- `supply`
- `demand`

Additional independent station flags are also implemented:

- `fuel stop`
- `ammo stop`
- `trash stop`

These flags are orthogonal to the main supply/demand role and are used by resupply and forced route-change logic.

Stops no longer need to sit precharged before freighters can use them. A freighter may still choose any valid matching stop immediately, but the actual transfer waits at the dock until the stop's temporary hidden EEI has absorbed enough energy for that specific action. In the default mode that spend stays at `100MJ`; with the hard-mode startup setting enabled it instead scales to $n^2$ MJ for that station network, where $n$ is the number of freighters assigned to the same network ID.

### 4.3 Freighters have a looping multi-stop schedule

Each freighter stores:

- an ordered schedule of route legs,
- an active schedule-leg index,
- a saved integer network ID,
- optional pending route changes,
- route-forcing state,
- cargo state,
- active route claim state,
- travel timing/state data.

Each schedule stop currently stores:

- an operation type (`load` or `unload`),
- one route signal identifying the stop to visit,
- a minimum departure-load percentage from `1` to `100`,
- a fuel-interrupt toggle,
- an ammo-interrupt toggle,
- and a trash-interrupt toggle.

The GUI exposes those stops in a list with add/remove/reorder controls modeled after Factorio's train and space-platform schedule editors, including a more vanilla-style titlebar, shallow content frames, subheaders, and compact schedule action controls. Because Factorio only allows true drag targets on top-level screen frames, the freighter schedule now uses a custom grab-handle reorder flow inside that list: click a leg's handle to arm it for movement, hover another leg to preview the destination, then click that destination leg to place the moved entry there, while the existing up/down buttons remain available as a fallback. Demand-stop request manifests in the station GUI are now presented as requester-chest-style logistic sections: one section can preview a linked force logistic group in a read-only slot grid, and a second manual section uses boxed requester-style item slots with per-slot amount fields plus an always-available trailing empty slot so editing feels much closer to the vanilla requester chest. A stop can optionally layer in one of the force's requester-style logistic groups as a reusable request template while still allowing manual per-stop overrides. The runtime loops from the last stop back to the first.

To make that growing ruleset easier to maintain, the runtime helper logic is now being split out of the old monolithic `control.lua` into focused installer modules under `runtime/`: manifest/request helpers, schedule helpers, and route-planning helpers now live in separate files but still install into the same runtime environment so save compatibility and call sites stay stable.

Older saved `transfer` legs are migrated into two one-stop entries: a `load` stop for the old source signal followed by an `unload` stop for the old destination signal.

Older saves with partially migrated freighter cargo state are also tolerated during runtime rebuilds: when a legacy freighter still has a stale cargo count but no matching primary cargo item key, the mod now treats that fallback manifest as empty instead of crashing while rebuilding inbound unload reservations or cargo summaries.

`load` stops are more open-ended when they stand alone: the freighter flies to one matching pickup stop and loads transferable item types that its cargo hold can currently accept from that stop. When the next schedule leg is an `unload` leg, the pickup manifest is now capped to cargo that at least one currently valid matching demand stop can still accept, so paired load/unload schedules do not intentionally board excess requester cargo.

`unload` stops are the inverse: the freighter flies to one matching demand stop and unloads only the carried cargo types that stop is currently requesting, and it now rechecks that live requester need again at transfer time so a stop that was satisfied while the freighter was in flight does not get overfilled by stale reservations.

The freighter still does **not** currently have full train-style wait-condition chains, combinator-driven conditions, or arbitrary interrupt rules. Instead, each stop now supports a constrained set of load/unload modes, departure requirements, and service interrupts built around the mod's existing fuel/ammo/trash detour systems.

## 5. Current Automated Behavior

### 5.1 Route selection

When idle, a freighter looks for:

- any non-demand station matching its `from` signal,
- any demand station matching its `to` signal,
- only stops on the freighter's current surface,
- an item present at the source that is not considered defense ammo,
- enough source stock to satisfy the active leg's minimum departure-load percentage for that item,
- enough effective room at the destination to satisfy that same minimum departure requirement after subtracting matching cargo already in motion or waiting to unload from other freighters.

It only considers source and destination stops that share the same network ID. Within that filtered set, it prefers higher-priority destination stops first, then higher-priority source stops, and only then falls back to transferable amount, source-vs-destination stock difference, and shorter route distance.

For `load` stops, the route chooser instead looks only for one matching pickup stop on the current network that can add non-defense cargo into the freighter; if the next schedule leg is an `unload` leg and that target demand station still has its complex-demand checkbox enabled, that pickup cargo is limited to what the chosen destination can accept right now. For `unload` stops, it looks only for one matching demand stop on the current network that can satisfy any of that stop's configured demand requests from the freighter's currently carried cargo when that station keeps complex demands enabled, then rechecks that live demand again during the actual unload transfer; with the checkbox disabled on that station, the demand stop simply accepts any carried cargo it still has room for.

If a `load` leg has no route that can depart yet, the freighter now pre-positions at the best matching pickup stop only when that source signal is oversubscribed on the current surface/network, meaning there are more relevant load-leg freighters than usable supply stops for that signal. While parked at that source, it keeps reevaluating live cargo and paired unload demand until the leg can finally leave.

### 5.2 Cargo loading and unloading

Current cargo behavior is based on **real inventory transfer**:

- items are removed from the source station inventory,
- inserted into the freighter inventory,
- transported by the freighter,
- then inserted into the destination station inventory.

Partial unloading is supported. If the destination cannot accept the full load, the freighter waits and retries later until all cargo is transferred.

Each active schedule leg can require a minimum departure load percentage. The selected route departs with the largest currently transferable amount up to full capacity once both pickup stock and destination room meet that leg's configured threshold after accounting for matching inbound freighter cargo already assigned to the destination stop.

That percentage is now enforced against the freighter's real usable cargo-space fill at both route-selection time and the actual `load` stop: a pickup route is only chosen when the currently transferable manifest can fill enough cargo slots to satisfy the configured threshold, and once docked the freighter keeps loading until its current cargo inventory reaches that same fill percentage. `unload` stops still transfer whatever cargo they can when they arrive and then wait only on destination room.

### 5.3 Demand requests

Demand stations now expose a logistics-request-style request list in the station GUI.

- Each request row stores one item prototype and a target stock amount.
- Requested amounts are saved on built stations, ghosts, blueprints, and copy-paste settings through the existing station tag path.
- Each demand station also stores its own complex-demand checkbox, defaults that checkbox to off on newly created or migrated records, and preserves the chosen mode through blueprints and copy-paste settings.
- When a demand station keeps complex demands enabled, a freighter evaluating an `unload` stop only reserves and unloads cargo for items in that request list, and only up to the missing amount after subtracting the station's current inventory plus already-reserved inbound cargo.
- When that checkbox is disabled on a specific demand station, the advanced request-group and manual-request controls are hidden in the station GUI, the saved request list is preserved in the background, and that one stop falls back to accepting any carried cargo it has room for.
- Even with complex demands enabled, a demand stop that has no configured requests yet still falls back to the older behavior of accepting any carried cargo it has room for so old saves keep working until the player fills in explicit requests.

### 5.3 Travel model

Travel is currently a hybrid model:

- If the entity is a `spider-vehicle`, it uses spidertron autopilot destination behavior.
- Travel time is still modeled with scripted timing values.
- If needed, the code periodically reasserts the destination.
- On arrival or during docking/resupply/unload completion, the mod teleports the freighter to the station dock position.

The station dock point is currently a fixed offset below the station.

### 5.4 Route claiming

The mod still stores a route key per active trip, but it no longer blocks multiple freighters from serving the exact same source-to-target-item lane at the same time. Instead, dispatch now subtracts matching cargo already in motion or waiting to unload at the target stop before deciding whether another full freighter should depart.

Freighter dispatch also now checks whether the freighter has enough burner-energy for the exact trip it is about to take before it commits the pickup, and will prefer resupply first when the route-specific trip estimate exceeds the fuel currently available. That estimate now follows the freighter's actual burner travel model instead of the older synthetic flat-cost formula.

The source station only spends its `100MJ` send action once the dispatch has fully committed, so failed fuel/teleport preflight no longer burns a station charge.

To keep the current many-to-many network model viable at larger save scales, the runtime now keeps inbound dropoff reservations incrementally, uses short-lived station inventory caches during route scoring, and also caches matched/powered station candidate lists for the rest of the current tick so every idle freighter does not rebuild the same route candidate sets again and again.

Instead, stations and freighters are now assigned to fixed tick buckets so each record is still serviced on the same overall cadence, but the total workload is spread across the full `30`-tick update window to reduce recurring UPS spikes.

The runtime also now prunes invalid-stop and empty-route warning bookkeeping when stations/freighters disappear or when a stop's invalid contents are no longer present, which prevents long AFK sessions from carrying around stale warning state forever.

## 6. Fuel, Ammo, and Trash Systems

### 6.1 Fuel system

Freighters consume actual fuel items from their burner fuel inventory.

Current fuel model:

- the game engine consumes real burner fuel while the freighter moves,
- dispatch fuel checks now estimate one-way cost from the freighter's burner power draw and scripted travel time,
- with the current prototype and travel settings that works out to about `0.021MJ per tile` one-way,
- very short hops still honor the minimum travel window, so they floor at about `1.3MJ`.

When fuel energy falls below the low threshold, the freighter will try to divert to the nearest appropriate resupply stop.

Even above that generic low-fuel threshold, a freighter now also diverts for refueling before dispatch if its current burner-energy pool is insufficient for the specific trip it is about to start.

Both of those fuel detours are now controlled per schedule leg. If fuel interrupts are disabled on the active leg, the freighter waits instead of auto-detouring.

If a fuel stop offers a different burnable item than the one already sitting in the freighter fuel inventory, the freighter now moves that incompatible leftover fuel into its cargo inventory, loads the new fuel immediately, and then auto-diverts the leftover fuel to the nearest Trash stop before taking another logistics job.

That automatic leftover-fuel dump is also controlled per schedule leg. If trash interrupts are disabled on the active leg, the freighter keeps waiting with the staged incompatible fuel in cargo until the player intervenes or re-enables trash interrupts on that leg.

Freighters marked for deconstruction also stop participating in logistics entirely while the mark is present: they do not depart, travel, unload, or resupply, and any temporary route claim is released until the mark is cleared.

Resupply, ammo, fuel, and trash stops are no longer ignored just because they are not already charged; they are eligible immediately, but the actual transfer waits for that stop's temporary transfer EEI to accumulate the required energy.

When a freighter already has an active pickup, delivery, or forced-dump context, automated fuel/ammo/trash stop selection stays inside that same station network so service traffic does not silently bridge separate logistics networks.

Resupply stops also now spend their `100MJ` action charge only when they can actually transfer fuel and/or ammo into the freighter, so a no-op refuel wait no longer drains station power. If a freighter reaches a resupply stop and is already topped up enough that no further transfer is needed, it now clears that wait instead of idling there indefinitely. Manual freighter schedule edits now also cancel a deadlocked fuel/ammo interrupt wait when the current interrupt stop cannot actually transfer any of the needed resupply items, so queued schedule changes are applied immediately instead of being held hostage until that stop eventually stocks the missing item. Fuel and ammo interrupts now also wait until the stop has enough stock to top off the freighter's current burner-slot refill or preferred capsule-ammo refill in one visit before spending that `100MJ` action charge, so trickle-fed stops no longer burn one full action on one-item dribbles.

### 6.2 Ammo system

Ammo support prefers **Rampant Arsenal capsule ammo** naming conventions when those items exist.

Implemented behavior:

- the mod builds a catalog of items ending in `-capsule-ammo-rampant-arsenal`,
- if none of those items exist, it falls back to base game rocket ammo first for the `rocket-launcher` path and only then to cannon shells for the `tank-cannon` path,
- prefers a built-in priority list if those items exist,
- can pull that ammo from an ammo stop into the freighter's ammo inventory,
- and that ammo-stop detour is now controlled by the active schedule leg's ammo-interrupt toggle.
- attempts to keep the freighter above a minimum ammo count when at least one ammo stop is available,
- excludes recognized defense ammo from normal cargo route selection.

Combat deployment behavior is not presently implemented beyond relying on the vehicle weapon/ammo setup.

### 6.3 Trash system

Trash stops are currently used for two purposes:

- receiving forcibly dumped cargo when the user requests an immediate route change,
- optionally tolerating miscellaneous inventory contents without the same warnings as pure fuel/ammo stops.

If the player forces a route change while the freighter still has cargo, the freighter tries to find the nearest trash stop, dump all carried items there, and then apply the new route.

Trash dumping waits for the chosen trash stop's active transfer charge to finish before cargo moves.

Trash stops now spend their `100MJ` action charge only when they can actually accept at least one carried stack from the waiting freighter, so a blocked trash stop no longer drains power every tick while no cargo moves.

If a load stop, unload stop, resupply stop, or trash stop still manages to spend its current action charge without moving any cargo, fuel, or ammo, the mod now prints a throttled force-chat warning with a GPS ping for that stop so persistent no-op drain bugs can be found in live saves. In the default rules that charge is still `100MJ`; with freighter-network hard mode enabled it instead scales to the square of the number of freighters on that network in MJ.

Pickup stops now also rebuild the live load manifest before every waiting-load action charge. If the source no longer has enough live stock to bring the freighter up to its configured minimum departure fill, an empty freighter abandons the visit and a partially loaded freighter waits without spending more station power until enough stock accumulates.

## 7. Player Interface

The freighter configuration GUI now includes a `What is this freighter waiting on?` button that prints the current blocker to the player chat. The explanation covers route setup, damaged freighters, active source/destination transfer charging, the current burner-power-based trip fuel estimate, current fuel shortfall, source stock, destination capacity, resupply availability, inventory-space blockers at resupply, and other common reasons a freighter can remain idle or stalled.

### 7.1 Station GUI

Implemented station configuration UI includes:

- route signal picker,
- supply/demand dropdown,
- fuel stop checkbox,
- ammo stop checkbox,
- trash stop checkbox,
- charge-rate override field,
- save button,
- hotkey hints.

For built stations, the vanilla station GUI also gets a separate Flying Freighters side panel on the right when the stop is wired into a red or green circuit network, and that panel contains:

- circuit toggle for enabling signed station-type control from the selected circuit signal,
- signal pickers for the station-type, priority, network-ID, and stored-energy circuit signals,
- short explanatory text describing how each selected signal behaves.

Station ghosts keep the normal custom station popup for route and stop settings, but their circuit toggle and signal pickers now live in the Flying Freighters side panel next to the vanilla ghost picker GUI.

Supported hotkeys while editing a station:

- `Q` toggles supply/demand
- `Z` toggles fuel stop
- `X` toggles ammo stop
- `C` toggles trash stop
- `E` confirms/saves

Successful station and freighter saves now also play Factorio's standard menu confirm sound so the custom GUI gives the same audio feedback as the base game's confirm actions.

### 7.2 Freighter GUI

Implemented freighter configuration UI includes:

- `from` route signal picker,
- `to` route signal picker,
- `force route change now` checkbox,
- save button.

The custom `E` confirm hotkey now ignores the mod's save action while one of the route signal choose-elem pickers is active, so pressing `E` inside the signal picker confirms that selection first; pressing `E` again from the normal freighter GUI then saves the route.

### 7.3 Global/map configuration UI

The old map-wide freighter selection GUI from the 1.1-era remote workaround still exists in code, but normal config access no longer falls back to it.

- Players now need to target a flying freighter or flying freighter station directly when using the config hotkey/button.
- If nothing relevant is selected, the mod simply asks the player to select a valid target first.

### 7.4 Quick access buttons

The mod dynamically adds configuration buttons to:

- the player's left GUI for stations and freighters,
- and a relative GUI attached to supported freighter entity UIs.

### 7.5 In-world visualization

Stations currently display their configuration in three places:

- rendered text labels over the entity,
- renamed backer names on the entity when supported,
- chart tags on the map.

Displayed station information includes:

- route signal,
- supply/demand role,
- fuel/ammo/trash flags.

When circuit station-type mode or circuit network-ID overrides are active, the rendered stop text, backer-name label, and chart tag now reflect the stop's current effective type and effective network rather than only the saved GUI value.

## 8. Persistence, Copying, and Migration

### 8.1 Existing save migration behavior

The code already includes migration-like normalization logic for older station and freighter data fields, especially around route signal storage and legacy stop naming formats.

Legacy station runtime records are also repaired lazily: on load or first interaction, the mod can rescan existing station entities, rebuild missing runtime records, and recreate hidden cargo companions if an older save predates the current powered-station architecture.

### 8.2 Blueprint support

Station and freighter settings are currently written into blueprint entity tags. The same tag payload is also used when configuring station or freighter ghosts directly in-world before they are built. When they are built from blueprint or revived from a configured ghost, these settings are restored:

- route signal
- station type
- fuel stop flag
- ammo stop flag
- trash stop flag
- charge-rate override
- freighter `from` route signal
- freighter `to` route signal

Blueprint support is currently implemented for both **stations and freighters**.

For stations, the saved circuit toggles for `set station type from circuit` and `read stop contents` are also preserved through ghosts, copy-paste, and blueprints alongside the existing saved route, role, service flags, charge rate, priority, and network ID.

Malformed or hand-edited blueprint tag payloads are now treated defensively at load/apply time: station demand-request manifests and freighter schedules only go through their normalizers when the incoming tag field is actually a table, so an unexpected scalar/string payload falls back to the default empty behavior instead of risking a runtime error.

### 8.3 Copy-paste settings

Implemented copy behavior:

- station-to-station, station-ghost-to-station, station-to-station-ghost, and station-ghost-to-station-ghost settings paste all work,
- freighter-to-freighter, freighter-to-freighter-ghost, freighter-ghost-to-freighter, and freighter-ghost-to-freighter-ghost settings paste all work,
- those freighter copy-paste combinations preserve the full ordered schedule and active route signal fields through the same freighter settings tag payload used by ghosts and blueprints.

### 8.4 Freighter death recovery

When a freighter dies, the mod stores its last route settings and backer name for its force. A newly built freighter can inherit that data if placed within about 10 minutes.

Newly built or revived freighters now also preload one stack of the selected starter fuel into an otherwise empty burner inventory. The runtime-global `Starter fuel for newly built freighters` map setting defaults to `coal`, and choosing `none` disables the preload.

## 9. Safety Rules and Validation

The current mod contains several player-facing protections:

- players are prevented from driving a freighter manually,
- spidertron remote orders to freighters are cancelled,
- invalid contents in fuel/ammo stops can generate warnings,
- empty station route keys generate delayed warnings with a clickable GPS ping in chat,
- freighters missing `from` and/or `to` routes generate delayed warnings with a clickable GPS ping in chat,
- invalid entities are periodically cleaned from runtime state.

## 10. Current Compatibility State

### 10.1 Implemented compatibility hooks

The current code explicitly accounts for:

- Factorio `2.0` metadata/runtime loading,
- the `storage` runtime table used by Factorio `2.0`,
- base game spidertron or tank fallback,
- Rampant Arsenal / RampantArsenalFork style gun/ammo prototype names,
- legacy save data naming formats.

### 10.2 Important current gaps

The mod now **loads under Factorio 2.0.76 and passes the workspace smoke test**, but important compatibility work is still unfinished:

- `info.json` now declares `factorio_version` `2.0` and optional dependencies on `space-age` and `RampantArsenalFork`.
- Prototype-stage Space Age integration is now present through optional startup-controlled planet locks that adjust Flying Freighter recipe ingredients and technology prerequisites.
- `data-updates.lua` and `data-final-fixes.lua` currently exist but are empty.
- Compatibility with other large mods still needs broader real-world validation beyond smoke loading.

So the mod has crossed the basic 2.0 loadability milestone, but the quick-reference compatibility goal is still ahead of the currently visible implementation depth.

## 11. Current Design Boundaries

The code presently behaves like a narrow, opinionated system with the following boundaries:

- one freighter services one configured signal lane at a time,
- pickup comes from any matching supply stop with valid cargo,
- delivery goes to any matching demand stop with capacity,
- cargo is item-based in practice,
- fluid signals can be selected as route keys, but there is no actual fluid transport implementation yet,
- cargo movement is chest-to-vehicle-to-chest rather than through logistic network requests,
- resupply uses physical items stored in station inventories.

## 12. What Is Not Yet Implemented

Based on the current codebase, these features do **not** appear to be implemented yet:

- true fluid hauling (wont add, as this would be tons of work for something that would likely be completely useless because pipes are already so overpowered),
- station limits (wont add, as this is against the nature of the mod),
- fully tuned Space Age-aware progression and balance beyond the current planet-lock toggles (requires a large public playtest first),
- explicit RampantArsenalFork-specific handling,
- advanced combat deployment behavior beyond weapon/ammo provisioning,
- polished art/assets unique to the mod (requires finding an artist first),
- custom prototype tuning in `data-updates` / `data-final-fixes`.

## 13. Current Assessment

The mod currently contains a meaningful playable core:

- configurable stops,
- configurable freighters,
- autonomous route selection,
- real inventory transfer,
- burner fuel consumption,
- capsule ammo resupply,
- trash dumping for forced reroutes,
- map labels/chart tags,
- copy/paste and blueprint persistence for both stations and freighters.

The main unfinished area is not the existence of a core loop, but rather the **2.0 polish, compatibility pass, and feature-completion pass** needed to turn this into a finished, robust logistics mod.

## 14. Current Design/Code Desync Notes

These are the main desyncs visible right now:

- The quick reference says compatibility should especially cover `Space-Age` and `RampantArsenalFork`; the mod now includes explicit prototype-side Space Age gating, but it still needs broader compatibility validation beyond smoke loading.
- Older statements that stop priorities and circuit network integration were not implemented would now be incorrect; both features are present in the current code.
- The mod description promises a long-distance bulk transport option, which is true in spirit, but the current implementation is still a focused scripted prototype rather than a broadly finished logistics platform.

## 15. Practical Current Player Flow

The current intended player flow appears to be:

1. Research `flying-freighters`.
2. Build at least two stations and one freighter.
3. Open station GUIs and assign route signals plus supply/demand roles.
4. Optionally mark some stations as fuel, ammo, and/or trash stops.
5. Open the freighter GUI and assign `from` and `to` route signals.
6. Let the freighter automatically pick up cargo from a matching supply stop and deliver it to a matching demand stop.
7. Allow the freighter to self-divert for fuel/ammo resupply when low.
8. Force an immediate reroute if necessary, which dumps existing cargo at a trash stop first.

That is the current feature-complete loop present in code today.
