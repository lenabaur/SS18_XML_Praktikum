xquery version "3.0";
module namespace memory = "http://basex.org/memory";

declare
  %rest:path("memory/start")
  %output:method("xhtml")
  %output:omit-xml-declaration("no")
  %output:doctype-public("-//W3C//DTD XHTML 1.0 Transitional//EN")
  %output:doctype-system("http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd")
  function memory:start()
{
  <html xmlns="http://www.w3.org/1999/xhtml">
    <head>
      <title>BaseX HTTP Services</title>
	<link rel="stylesheet" type="text/css" href="../../../game.xml"/>    
    </head>
             <body bgcolor="#ADD6D8"/>
             <body>
               <text style =" font-family:'impact';margin-left: 12.5cm; margin-top:10%; font-size: 50pt; color: 466675; font-weight:bold;">memory</text>	
	           <text style =" font-family:'impact'; margin-left: 0cm; font-size: 30pt; color: 466675; font-weight:bold;">Battle</text>			
             </body>
  </html>
};


(: Setup:
    Creates the necessary database and sets RESTCallback functionality
    to persist gamestate after disconnects / timeouts and the closure
    of the browser tab. :)
declare 
    %rest:path("memory/setup")
	%output:method("xhtml")
	%updating
	%rest:GET
	function memory:setup()
	{
	let $memoryModelInit := doc("./static/game.xml")
	return(db:create("Memory",$memoryModelInit),
	db:output($memoryModelInit))
		
};


(: Show Lobby:
    Goes through all open memory games in the
    database and creates an HTML table with forms to join the different
    games and show additional information. The function returns the 
    finished HTML to show the rps lobby. :)
declare 
    %rest:path("memory/showLobby")
	%output:method("xhtml")
	%rest:GET
	function memory:showLobby()
	{
	let $gameDB := db:open("Memory")
	return
	<html>
			<head>
			   <!-- Datatable dependencies for the lobby -->
		      <link rel="stylesheet" type="text/css" href="../../../static/memory_css.css"/>    
			</head>  
	        <body>
	           <text style =" font-family:'impact'; font-size: 30pt; color: 466675; font-weight:bold;">Welcome to</text>			
	           <text style =" font-family:'impact';margin-top:10%; font-size: 50pt; color: 466675; font-weight:bold;">memory</text>			
		       <form style ="margin-top: 5%;" action="/memory/start" method="POST" enctype="application/x-www-form-urlencoded">
                     <button onclick="/start">Neues Spiel beginnen</button>
               </form>
               <form style ="margin-left: 6cm; margin-top:-1.05cm;" action="/memory" method="POST" enctype="application/x-www-form-urlencoded">
                     <button onclick="/start">Highscore</button>
               </form>
               <form style ="margin-left: -6.8cm; margin-top:-1.05cm;" action="/memory" method="POST" enctype="application/x-www-form-urlencoded">
                     <button onclick="/start">Spiel fortsetzen</button>
               </form>
               <img width="80x" style= " margin-top: 50; margin-left: 0%" src="https://png.icons8.com/dusk/50/000000/brainstorm-skill.png"/>
               <img width="90x" style= " margin-left: 1%" src="https://png.icons8.com/color/50/000000/brain.png"/>
	           <img width="80x" style= "margin-left: 1%" src="https://png.icons8.com/dusk/50/000000/brain.png"/>
	           <img width="80x" style= "margin-left: 1%" src="https://png.icons8.com/ultraviolet/50/000000/idea.png"/>
	           <img width="80x" style= "margin-left: 1%" src="https://png.icons8.com/dusk/50/000000/idea.png"/>
	           <img width="80x" style= "margin-left: 1%" src="https://png.icons8.com/dusk/50/000000/development-skill.png"/>
	           <img width="80x" style= "margin-left: 1%" src="https://png.icons8.com/dusk/50/000000/developer.png"/>
	           <img width="80x" style= "margin-left: 1%" src="https://png.icons8.com/dusk/50/000000/headache.png"/>
	           <img width="80x" style= "margin-left: 1%" src="https://png.icons8.com/cotton/50/000000/brain.png"/>
	           <h1 style= "color: #583843; font-size: 20pt; margin-top: 10;">"train your brain"</h1>
	        </body>   
            <body bgcolor="#FAC8BF"/>
         <h1 style= "color: #583843; font-family: 'fantasy'; font-size: 20pt; margin-top: 4cm;">Who wants to battle?</h1>
		<form style="margin-top:-9.5cm ;font-size:25pt; color: 466675; font-family:bold;" action="/memory/start" method="POST" enctype="application/x-www-form-urlencoded">
		 <body>Name: <input type="text" name="fullname"></input></body> 
         <body>Name: <input type="text" name="fullname"></input></body> 
         <body>Name: <input type="text" name="fullname"></input></body> 
         <body>Name: <input type="text" name="fullname"></input></body> 
         <button style="margin-top: 10cm" onclick="/start">Spiel fortsetzen</button>
          </form>
	</html>
};
