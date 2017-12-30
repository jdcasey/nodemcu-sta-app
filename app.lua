
local module={}
function module.start()
    print("Retrieving...");
    -- conn = net.createConnection(net.TCP, 0)
    -- conn:on("receive", function(conn, pl) print(pl) end)
    -- conn:connect(80, "172.17.1.1")
    -- conn:send("GET /login?username=guest&password=guest&accept=true&dst=http%3A%2F%2Fwww.google.com%2F HTTP/1.1\r\nHost: 172.17.1.1\r\nConnection: keep-alive\r\nAccept: */*\r\n\r\n")

    conn2 = net.createConnection(net.TCP, 0)
    conn2:on("receive", function(conn, pl) print(pl) end)
    conn2:connect(80, "216.58.194.68")
    conn2:send("GET /search?q=nodemcu%20rocks HTTP/1.1\r\nHost: www.google.com\r\nConnection: keep-alive\r\nAccept: */*\r\n\r\n")
end
return module
