require 'em-websocket'

EM.run do
   
    @clients = []
     EM::WebSocket.start(:host => '0.0.0.0', :port => '8080') do |ws|

   EM::WebSocket.start(:host => '0.0.0.0', :port => '8080') do |ws|
    ws.onopen do |handshake|
            @clients << ws
            @name=handshake.path
            @name=@name.sub("/" ,"")
            puts "open";
        end
    ws.onclose do
            ws.send "Closed."
            puts "Closed."
            @clients.delete ws
        end

    ws.onmessage do |msg|

                @clients.each do |socket|
                socket.send "#{@name}:"+msg
              end
               
        end
   end
end

