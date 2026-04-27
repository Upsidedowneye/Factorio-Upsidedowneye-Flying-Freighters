This is a Factorio mod that adds a late-game logistic option that is a mix of trains and bots.

Always keep this file referenced.
Always keep the 10-pager game design document (GDD.md) updated and reference it as much as you want.
Always run a smoke test with ./upsidedowneye-flying-freighters/oragnization/run-smoke-test.sh to verify the game will load successfully before declaring all tasks as completed.
If the smoke test fails, fix the error before ending your response.
This mod was made for 1.1 but only half finished before trying to port it to 2.0.
Your directory for all of your Factorio saves, mods, configs, etc is /run/media/upsidedowneye/B4EAD25BEAD21986/Users/Upsidedowneye/Programs/Factorio/2.1/AI/
My directory however is /run/media/upsidedowneye/B4EAD25BEAD21986/Users/Upsidedowneye/Programs/Factorio/2.1/Variables/
My directory is read-only so if I, for example, prompt you to look at a save in my directory, first copy the save into your directory and then test it there.
an exception to the above rule is you should always copy this mod to my directory after making a change and after the smoke test passes with ./upsidedowneye-flying-freighters/oragnization/copy-mod-to-variables.sh or by running a smoke test so that i can continue testing.
The workplace is set to the mods folder of your directory so you can peek at how things are named in other mods if needed for compatability.
The mod we are working on is called "upsidedowneye-flying-freighters".
Compatability should be present with all other mods on the mod portal, but most importantly the mod should work with Space-Age and RampantArsenalFork.
If you find yourself running the same, long command a lot, consider making a shell script for it.
If you notice a desync between what the code suggests is going on and the GDD claims is happening, point it out.
The Factorio API docs can be found locally at /run/media/upsidedowneye/B4EAD25BEAD21986/Users/Upsidedowneye/Programs/Factorio/2.1/Linux/doc-html/ . Avoid the online API docs.
The old API docs for 1.1 (if needed) can be found locally at /run/media/upsidedowneye/B4EAD25BEAD21986/Users/Upsidedowneye/Programs/Factorio/1.1/Linux/doc-html/
If a bug persists multiple times after attempted patches, begin adding logs to see what is going wrong.
My factorio-current.log can always be found at /run/media/upsidedowneye/B4EAD25BEAD21986/Users/Upsidedowneye/Programs/Factorio/2.1/Variables/factorio-current.log
rg isn't installed here, however grep, sed, and find can be used in it's place.
Please do not comment about unrelated warnings.
Don't load headlessly for smoke tests after changing something graphics related.
Always try to do things with data-stage code and only use runtime code if data-stage code doesn't work.
Always write detailed code comments.
Don't be scared to redo large sections of code if it means optimizing the code.
Always profile optimizations before and after with smoke tests to verify the optimization actually resulted in a performance increase. Depending on what was optimized you may have to copy my most recent save or ask me to test for you.
Let me handle git stuff.
Most doc searches will be very noisy.
Always ask before version bumping.