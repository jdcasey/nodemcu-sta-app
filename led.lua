local module = {}

function module.invert()
    if module.ledStatus == gpio.LOW then
        module.ledStatus = gpio.HIGH
    else
        module.ledStatus = gpio.LOW
    end
    gpio.write(module.ledPin, module.ledStatus)
end

function module.switch(value)
    if value == true then
        module.ledStatus = gpio.LOW
    else
        module.ledStatus = gpio.HIGH
    end
    gpio.write(module.ledPin, module.ledStatus)
end

function module.blink()
    module.invert()
end

function module.start()
    if config == nil or config.ledPin == nil then
        module.ledPin = 4
    elseif config.ledPin ~= nil then
        module.ledPin = config.ledPin
    end

    module.ledStatus = gpio.LOW
    gpio.mode(module.ledPin, gpio.OUTPUT)

    for i=1,3 do
        module.invert()
        tmr.delay(250000)
    end
end

return module
