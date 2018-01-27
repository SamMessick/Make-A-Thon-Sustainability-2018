-- John Longworth December 2016
-- This program writes data to a mysql database
print("\njlwriter.lua started\n")
field=1125
value=710
conn=nil
conn=net.createConnection(net.TCP,0) 
                       
conn:on("connection",function(conn, payload) 
  print('\nConnected') 
  conn:send("GET /writer.php?field="..field.."&value="..value
  .."HTTP/1.1\r\n" 
  .."Host: localhost\r\n" 
  .."Connection: close\r\n"
  .."Accept: */*\r\n"
  .."User-Agent: Mozilla/4.0 (compatible; esp8266 Lua; Windows NT 5.1)\r\n"
  .."\r\n")
end)  

conn:on("sent",function(conn)
  print("\nSent")
  conn:close()
end)

conn:on("disconnection",function(conn)
  print("\nDisconnected")
end)

conn:connect(80,'127.0.0.1') 

