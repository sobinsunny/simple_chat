function WebSocketTest()
{
  if ("WebSocket" in window)
  {
     var text=f.input_text.value;
     var ws = new WebSocket("ws://localhost:8080/Sobin");
     ws.onopen = function()
     {
        // Web Socket is connected, send data using send()
        ws.send(text);
     };
     ws.onmessage = function (evt) 
     { 
          var i= evt.data;         
          div = document.createElement('div'); 
          $(div).addClass("b_post").html("<p>"+i+"</p>");              
          $("#content_area").prepend(div);
     };
     ws.onclose = function()
     { 
        alert("Connection is closed..."); 
     };
  }
  else
  {
     // The browser doesn't support WebSocket
     alert("WebSocket NOT supported by your Browser!");
  }
}
