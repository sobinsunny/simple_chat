$(document).ready(function() {

  if ("WebSocket" in window)
  {
     
     var ws = new WebSocket("ws://localhost:8080/albin");
     ws.onopen = function()
     {
     };
     ws.onmessage = function (evt) 
     { 
         
                var i= evt.data;   
                div = document.createElement('div'); 
                $(div).attr('id','talkbubble').html("<p>"+i+"</p>");              
                $("#content_area").append(div);
     };
  ws.onclose = function()
     { 
        // websocket is closed.
        alert("Connection is closed..."); 
     };
  }
  else
  {
     // The browser doesn't support WebSocket
     alert("WebSocket NOT supported by your Browser!");
  }
$('#send_button').click(function() {
  var text=f.fname.value;
  ws.send(text);
});
});
