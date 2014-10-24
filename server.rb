require 'em-websocket'


EM.run do
   @clients=[]
    @names=[]
   EM::WebSocket.start(:host => '0.0.0.0', :port => '8080') do |ws|
    ws.onopen do |handshake|
            @clients << ws
            @name=handshake.path
            @names<<@name.sub("/" ,"")
            puts "open";
        end
    ws.onclose do
            ws.send "Closed."
            @clients.delete(ws)
        end

    ws.onmessage do |msg|
                puts ws
                a=@clients.index(ws)
                puts a
                @username=@names[a]
                puts @username
                @clients.each do |socket|
                     socket.send "#{@username}:"+msg
                
                end
               
        end
   end
end


