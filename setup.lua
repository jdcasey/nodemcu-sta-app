local module = {}

local function wifi_wait_ip()  
  led.invert()
  if wifi.sta.getip()== nil then
    print("IP unavailable, Waiting...")
  else
    tmr.stop(1)
    print("\n====================================")
    print("ESP8266 mode is: " .. wifi.getmode())
    print("MAC address is: " .. wifi.ap.getmac())
    print("IP is "..wifi.sta.getip())
    print("====================================")

    led.switch(true)
    app.start()
  end
end

local function wifi_start(list_aps)  
    if list_aps then
        for key,value in pairs(list_aps) do
            print("Checking for AP config: "..key)
            if config.SSID and config.SSID[key] then
                staconf = config.SSID[key]

                print("Setting mode: "..staconf.mode)
                if staconf.mode == "b" or staconf.mode == "B" then
                    wifi.setphymode(wifi.PHYMODE_B)
                elseif staconf.mode == "g" or staconf.mode == "G" then 
                    wifi.setphymode(wifi.PHYMODE_G)
                else 
                    wifi.setphymode(wifi.PHYMODE_N)
                end

                wifi.setmode(wifi.STATION);

                local sta_cfg={}
                sta_cfg.ssid=key
                sta_cfg.pwd=staconf.password

                wifi.sta.config(sta_cfg)
                wifi.sta.connect()

                print("Connecting to " .. key .. "...")
                --config.SSID = nil  -- can save memory
--                tmr.stop(1)
                tmr.alarm(1, 1000, 1, wifi_wait_ip)
            end
        end
    else
        print("Error getting AP list")
    end
end

function module.start()
  if config == nil or config.SSID == nil then
      print("Cannot find WiFi configuration!")
  else
      led.start()

      tmr.alarm(1, 250, 1, led.blink)

      print("Configuring Wifi ...")
      wifi.setmode(wifi.STATION)
      wifi.sta.getap(wifi_start)
  end
end

return module  
