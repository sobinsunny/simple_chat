require 'em-websocket'

EM.run {
    @clients = []
     EM::WebSocket.start(:host => '0.0.0.0', :port => '8080') do |ws|

     ws.onopen do |handshake|
                   @clients << ws
      end

    ws.onclose {
                     @clients.delete ws 
               }
    
     ws.onmessage do |msg|
                 puts "Received Message: #{msg}"
                        @clients.each do |socket|
                        socket.send msg
                    end
      end
      
  end
}
