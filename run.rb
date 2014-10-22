# Gemfile
source 'https://rubygems.org'

gem 'thin'
gem 'sinatra'
gem 'em-websocket'



# app.rb
require 'thin'
require 'sinatra/base'
require 'em-websocket'

EventMachine.run do
  class App < Sinatra::Base
    get '/' do
      erb :index
    end
  end

  # our WebSockets server logic will go here

  App.run! :port => 3000
end


# views/index.erb
<!doctype html>
<html>
  <head>
  </head>
  <body>

      # WebSockets Chat App
      <div id="chat-log">

        <input type="text" id="message">
        <button id="disconnect">Disconnect</button>



    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script>
      // where our WebSockets logic will go later
    </script>
  </body>
</html>