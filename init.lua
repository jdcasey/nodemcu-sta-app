config=require("config")
app = require("app")
led = require("led")
setup = require("setup")
if config.RUN == true then
    setup.start()
end

