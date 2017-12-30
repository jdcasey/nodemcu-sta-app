# Basic STATION-Mode Application Framework for Use with NodeMCU / Lua

This framework was generalized from the ThingTweet example in: https://github.com/sankarcheppali/NodeMCUProjects

It will handle the nuts and bolts of reading configurations for a series of WiFi networks, establishing the WiFi connection, and then executing a user application (`app.lua`) once everything is setup. Optionally, it can execute your application on NodeMCU boot.

## Files

* `init.lua` - This is the entry point for the application. It simply loads the other files when NodeMCU boots, then **if `module.RUN=true` is set in `config.lua`**, it will call `setup.start()` from `setup.lua`.
* `led.lua` - Controls the status LED. By default, this is the onboard LED, but can be reassigned using `module.ledPin` in `config.lua`.
* `setup.lua` - This contains the WiFi connection logic. It uses the network settings from `config.lua`.
* `config.lua` - This contains the list of networks configured for use.
* `app.lua` - This contains your application logic. It assumes the WiFi is connected.

## NOTE: Development Mode

If you're developing a new application, it may be important to avoid starting your application when the NodeMCU boots (to avoid an infinite reboot problem in the event of a bad app.lua file). To avoid this, simply avoid setting `module.RUN=true` in `config.lua`. Leaving this setting out will set it to `false` by default.

Once you have your application uploaded, you can fire it off using `setup.start()` from the ESPlorer command interface.

## Framework Files

Upload the `setup.lua` and `init.lua` files, which should remain unchanged for most applications. 

## Application File

Customize `app.lua` with your business logic, which can assume the WiFi connection is present.

## Network File

Finally, provide your WiFi configuration(s) in the `config.lua` file.
