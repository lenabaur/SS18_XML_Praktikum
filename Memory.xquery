xquery version "3.0";
module namespace memory = "http://basex.org/memory";
import module namespace helper = "http://basex.org/memory/helper" at "memory_helper.xquery";


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


(:addPlayer adds a new Player to the Database. The variables have to be given through an HTML-Dokument:)
declare
  %rest:path("memory/addPlayer")
  %updating
  %rest:POST
  %rest:form-param("fname","{$firstname}", "(no message)")
  function memory:addPlayer($firstname) {
      let $game := db:open("Memory")/memory
      let $playerID := helper:timestamp()
      let $player := <spieler id = "{$playerID}">
                          <spielerName>{$firstname}</spielerName>
                          <amZug stat="false"/>
                          <reihenfolge>2</reihenfolge>
                            <punkte>0</punkte>
                      </spieler>	
  return(insert node $player as last into $game)
};

(:SamZug increases the number of points by 1. The Parameter is the id as a String (right now for tests as an Integer; when used
within an HTML dokument the way of giving the parameters has to be changed):)
declare
%rest:path("memory/increasePoints")
%updating
%rest:POST
%rest:query-param("SamZug", "{$SamZug}")
(:%rest:form-param("SpielerAmZug","{$SamZug}", "(no message)"):)
function memory:increasePoints($SamZug as xs:integer) {
	let $game := db:open("Memory")/memory/spieler[@id="{$SamZug}"]
  let $elementOfPoints := data($game/punkte)
	let $newPoints := 1+ $elementOfPoints
	return(replace value of node $game/punkte with $newPoints)
};

(:comparePoints sorts the players by their score (does not work yet):)
declare
%rest:path("memory/comparePoints")
%updating
%rest:POST
function memory:comparePoints() {
  let $database := db:open("Memory")/memory/spieler
  let $stats := db:open("Stats")/memory
  for $x in $database
  order by $x/punkte
  let $input := <rang> 
                  <spielerID> {data($x/@id)} </spielerID>
                  <name> {data($x/spielerName)} </name>
                  <punkte> {data($x/punkte)} </punkte>
                </rang>
	return(insert node $input as last into $stats) 
};


declare
  %rest:path("memory/start")
  %output:method("xhtml")
  %output:omit-xml-declaration("no")
  %output:doctype-public("-//W3C//DTD XHTML 1.0 Transitional//EN")
  %output:doctype-system("http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd")
  %rest:form-param("fname","{$firstname}")
  function memory:start($firstname)
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
             
             <tbody>
             <table style="margin-left: 5cm; margin-top : 2cm;">
                 <tr>
                   <td>{$firstname}
                   
                   </td>
                     <td> Inhalt 2
                   </td>
                     <td>Inhalt3
                   </td>
                 </tr>
                 <tr>
                  <td>Inhalt
                   </td>
                     <td>Inhalt2
                   </td>
                     <td>Inhalt3
                   </td>
                 </tr>
                 <tr>
                    <td>Inhalt
                   </td>
                     <td>Inhalt2
                   </td>
                     <td>Inhalt3
                   </td>
                 </tr>
                 <tr>
                 <td>Inhalt
                   </td>
                     <td>Inhalt2
                   </td>
                     <td>Inhalt3
                   </td>
                 </tr>
            </table>
            </tbody>
  </html>
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
               <form action="/memory/start" method="POST" enctype="application/x-www-form-urlencoded">
				    <input type="submit" value="Create a new game" style="padding:10px;border:none;background-color:#4682B4;color:#ffffff;"/>
			     </form>
               <form style ="margin-left: 6cm; margin-top:-1.05cm;" action="/memory/start" method="POST" enctype="application/x-www-form-urlencoded">
                     <button type="submit">Highscore</button>
               </form>
               <form style ="margin-left: -6.8cm; margin-top:-1.05cm;" action="/memory" method="POST" enctype="application/x-www-form-urlencoded">
                     <button onclick="/start">Name eingeben</button>
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
		<form style="margin-top:-9.5cm ;font-size:25pt; color: 466675; font-family:bold;" action="/memory/addPlayer" method="POST" enctype="application/x-www-form-urlencoded">
		 Name: <input type="text" name="fname"></input> 
         Name: <input type="text" name="fullname"></input>
         Name: <input type="text" name="fullname"></input>
         Name: <input type="text" name="fullname"></input>
         <button type="submit">erstellen</button>
          </form>
	</html>
	
	};

(:declare   
%rest:path("memory/draw")
%rest:GET 
function memory:draw() {
   let $xslt := doc("./static/game.xsl")   
   let $input :=
        <data>
            <element>Element 1</element>
       </data>
       
   
   return (
        let $transformedGame := xslt:transform-text($input, $xslt, ())
    return (($transformedGame)))
}; 
:)
