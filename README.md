<h1 align="center">Cottonwool 1.0.0</h1>

<p align="center">Safe surfaces for GameMaker Studio 2.3.1</p>

<p align="center"><b>@jujuadams</b></p>

<p align="center">Chat about Cottonwool on the <a href="https://discord.gg/8krYCqr">Discord server</a></p>

&nbsp;

Cottonwool is a simple drop-in utility to help you take care of surface memory in GameMaker. Surfaces require you to explicitly create and destroy memory which is prone to user error and the source of many memory leaks. These are difficult and time-consuming to track down, but Cottonwool makes the process quick and safe.

&nbsp;

Cottonwool can be run into one of two modes: **garbage collection mode** and **test mode**. In garbage collection mode, any surfaces you accidentally leave hanging around will be cleaned up for you, stopping memory leaks from occurring. In test mode, instead of clearing up memory leaks, Cottonwool will alert you to the problem with an error message so you can decide how best to solve it yourself.

&nbsp;

Using Cottonwool to garbage collect surfaces is extremely easy:
1. Import the [latest package](https://github.com/JujuAdams/Cottonwool/releases/) into your project
2. Excute `cottonwool_update()` in a controller object's Step event

That's everything! You don't need to write any other code, just make sure `cottonwool_update()` is being run every frame by an object.

&nbsp;

Automatic garbage collection isn't to everyone's taste though, and there is a slight performance overhead when using Cottonwool to garbage collect surfaces. If you'd like to use Cottonwool to simply assist you with finding memory leaks rather than solving them for you, hop into `__cottonwool_config()` and set `COTTONWOOL_TEST_MODE` to `true`. This will now instruct Cottonwool to show an error every time a reference to a surface is lost without that surface being freed by an explicit call to `surface_free()`.

&nbsp;

`__cottonwool_config()` can be customised to suit your tastes, including verbose messages that log when surface references are created and lost, and how much information to store for each surface Cottonwool is tracking. Cottonwool itself can be toggled too off, should you so wish.

&nbsp;

-----

Cottonwool also comes with a handful of functions that return extra data about the surfaces in your game:

&nbsp;

### `cottonwool_get_number()` ###

Returns the number of surface being tracked by Cottonwool

&nbsp;

### `cottonwool_get_memory()` ###

Returns the *approximate* amount of texture memory (in bytes) allocated to surfaces being tracked by Cottonwool

&nbsp;

### `cottonwool_get_array(inclusive)` ###

Returns an array that contains structs for all surfaces being tracked by Cottonwool. If `inclusive` is set to `true` then surfaces that don't exist will be included in the array, otherwise they will be ignored.
