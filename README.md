# Flying Freighters

Flying Freighters are a mix between trains and bots. They are typically better than trains and bots in most situations, but shouldn't make trains or bots obsolete.

## Short description
Flying Freighters adds large late-game (post-purple science and post-Gleba science) air freight vehicles and dedicated stations that move bulk cargo between configured stops. Think somewhere between trains and logistic bots: scheduled, signal-driven, and built for long-haul hauling.

## Long description
Flying Freighters is a logistics mod focused on moving a lot of material across long distances without laying rail everywhere.

You build **Flying Freighter Stations**, configure each stop's role and signal identity, then assign **Flying Freighters** multi-leg schedules. Freighters automatically claim valid stops, load cargo, travel to demand points, unload, and continue through their route. They can also refuel, resupply ammo, and dump trash through dedicated service stops.

The current release is a strong playable vertical slice aimed at real factory use. It already supports the core logistics loop and a lot of quality-of-life around configuring and maintaining a network, while leaving room for better art and future iteration.

## Highlights
- Large dedicated freighter station entity for bulk loading and unloading.
- Flying freighter vehicle with ordered multi-leg route schedules.
- Signal-based source/destination routing.
- Station network IDs to separate independent freight networks.
- Station priorities and supply buffers for better route selection and staging.
- Per-station charging controls for power-hungry stops.
- Automated fuel, ammo, and trash-service legs.
- Blueprint/copy-paste persistence for station and freighter settings.
- In-game Tips and Tricks onboarding.
- First-flight achievement for building your first freighter.

## How it plays
1. Build a Flying Freighter Station.
2. Configure the station with the mod GUI or `Shift+F`.
3. Assign a signal and role so the stop can act as supply, demand, fuel, ammo, or trash support.
4. Build a Flying Freighter and give it an ordered schedule of route legs.
5. Let the freighter claim matching stops and move cargo automatically.

## Compatibility
- Supports Factorio 2.0.
- Optional compatibility with Space Age.
- Optional compatibility with Rampant Arsenal for capsules as ammo.

## Controls
- Shift+F: Open the Flying Freighters configuration UI for the selected station or freighter.

## Current limitations
- Visuals are still functional-placeholder quality in a few places and would benefit from custom sprite work.
- The design is already practical, but this is still an early public release rather than a final feature-complete logistics suite.

## Community help wanted
This mod still needs better custom sprite work. If you want to contribute art, please post it on the mod portal discussion page so it can be reviewed and folded back into the mod.

## Draft release note
This is the first public release of Flying Freighters. Includes the core freighter/station logistics loop, route scheduling, service stops, onboarding tips, first-flight achievement, multi-language locale support, and compatibility with Space Age and/or Rampant Arsenal.

## To do
Complex mode is still unfinished, and I still need to do some good testing. Thankfully that's what this beta is for! Expect many bugs, and report all of them on the mod portal discussion page or directly to my steam profile please.
