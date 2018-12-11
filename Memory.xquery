xquery version "3.0";
module namespace memory = "http://basex.org/memory";
import module namespace helper = "http://basex.org/memory/helper" at "memory_helper.xquery";
declare namespace xslt = "http://basex.org/modules/xslt";





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

declare
%rest:path("memory/addPlayer")
%updating
%rest:POST
%rest:form-param("fname","{$firstname}", "(no message)")
function memory:addPlayer($firstname) {
    let $game := db:open("Memory")/memory/spieler
    let $playerID := helper:timestamp()
    let $player := <spieler id = "{$playerID}">
    	                  <spielerName>{$firstname}</spielerName>
    	                  <amZug stat="false"/>
                          <punkte></punkte>
    	               </spieler>	
    return(insert node $player as last into $game)
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
	           <text style =" font-family:'impact'; font-size: 30pt; color: rgb(132,6,6); font-weight:bold;">We wish you a</text>			
	           <text style =" font-family:'impact';margin-top:10%; font-size: 50pt; color: rgb(132,6,6); font-weight:bold;">memory Christmas</text>			
		       
               <form action="/memory/start" method="POST" enctype="application/x-www-form-urlencoded">
				    <input type="submit" value="Create a new game" style="padding:10px;border:none;background-color:#4682B4;color:#ffffff;"/>
			     </form>
     
<svg style="margin-left: 0cm; margin-top: 2cm; width:15%; heighth:20%">
        <ellipse cx="128.58098" cy="45.87534" fill="#7f3f00" id="svg_7" rx="32.46766" ry="9.31509" stroke="#000000" stroke-dasharray="null" stroke-linecap="null" stroke-linejoin="null" stroke-width="0" transform="rotate(50.1104 52 51.5) matrix(0.870978 -0.491321 0.491321 0.870978 -82.5308 74.7181)"/>
        <circle cx="63" cy="33.5" fill="#7f3f00" id="svg_1" r="16.4795" stroke="#000000" stroke-dasharray="null" stroke-linecap="null" stroke-linejoin="null" stroke-width="0"/>
        <ellipse cx="50.36297" cy="81.74472" fill="#7f3f00" id="svg_22" rx="15.27133" ry="31.46958" stroke="#000000" stroke-dasharray="null" stroke-linecap="null" stroke-linejoin="null" stroke-width="0" transform="matrix(0.834533 0.329075 -0.290822 0.944304 35.2436 -12.7651)"/>
        <ellipse cx="152.51197" cy="57.90654" fill="#7f3f00" id="svg_12" rx="32.46766" ry="9.31509" stroke="#000000" stroke-dasharray="null" stroke-linecap="null" stroke-linejoin="null" stroke-width="0" transform="rotate(2.52614 79 49.5) matrix(0.997418 0.0718144 -0.0718144 0.997418 4.05637 -5.82246) matrix(0.870054 -0.481545 0.4908 0.853649 -82.3911 73.8072)"/>
        <ellipse cx="83.56897" cy="71.81186" fill="#7f3f00" id="svg_23" rx="15.27133" ry="31.46958" stroke="#000000" stroke-dasharray="null" stroke-linecap="null" stroke-linejoin="null" stroke-width="0" transform="matrix(0.798773 -0.375705 0.405826 0.891348 -16.1689 48.622)"/>
        <path d="m29.87617,50.56569c0,-1.24924 0,-2.39355 0,-3.39295c0,-1.16346 -0.5302,-2.31913 0.01626,-3.38462c0.47094,-0.91835 1.21594,-1.27391 1.50561,-2.4077c0.22079,-0.86429 1.52187,-1.0169 1.95408,-1.95133l1.42652,-0.1068l1.09802,-0.44035" fill="#ffffff" id="svg_25" stroke="#000000" stroke-dasharray="null" stroke-linecap="null" stroke-linejoin="null" stroke-width="0" transform="rotate(-20.1363 32.5 43.5) matrix(0.913009 0.40794 -0.40794 0.913009 20.8336 -10.6978)"/>
        <path d="m85.81094,22.82674c0,-1.24931 0,-2.3936 0,-3.39301c0,-1.1634 -0.53018,-2.3191 0.0162,-3.3846c0.47101,-0.9183 1.216,-1.2739 1.50562,-2.4077c0.22079,-0.8643 1.52188,-1.0169 1.9541,-1.9513l1.42648,-0.1068l1.09811,-0.4404" fill="#ffffff" id="svg_26" stroke="#000000" stroke-dasharray="null" stroke-linecap="null" stroke-linejoin="null" stroke-width="0" transform="rotate(144.141 94.8848 40.9921) matrix(0.913009 0.40794 -0.40794 0.913009 20.8336 -10.6978)"/>
        <path d="m64.73403,95.77028c0,-1.24931 0,-2.3936 0,-3.39301c0,-1.1634 -0.53018,-2.3191 0.0162,-3.3846c0.47101,-0.9183 1.216,-1.2739 1.50562,-2.4077c0.22079,-0.8643 1.52188,-1.0169 1.9541,-1.9513l1.42648,-0.1068l1.09811,-0.4404" fill="#ffffff" id="svg_28" stroke="#000000" stroke-dasharray="null" stroke-linecap="null" stroke-linejoin="null" stroke-width="0" transform="rotate(-137.798 67.6189 89.9284) matrix(0.913009 0.40794 -0.40794 0.913009 20.8336 -10.6978)"/>
        <path d="m66.51088,96.89943c0,-1.2493 0,-2.3936 0,-3.39301c0,-1.1634 -0.53021,-2.3191 0.0162,-3.3846c0.47098,-0.9183 1.216,-1.2739 1.50568,-2.4077c0.2207,-0.8643 1.52182,-1.0169 1.9541,-1.9513l1.42642,-0.1068l1.09818,-0.4404" fill="#ffffff" id="svg_29" stroke="#000000" stroke-dasharray="null" stroke-linecap="null" stroke-linejoin="null" stroke-width="0" transform="rotate(-164.591 47.0465 100.748) matrix(0.913009 0.40794 -0.40794 0.913009 20.8336 -10.6978)"/>
        <ellipse cx="58.5" cy="26.5" fill="#ffffff" id="svg_32" rx="2.5" ry="2" stroke="#000000" stroke-dasharray="null" stroke-linecap="null" stroke-linejoin="null" stroke-width="0"/>
        <ellipse cx="67" cy="27" fill="#ffffff" id="svg_33" rx="2.5" ry="2" stroke="#000000" stroke-dasharray="null" stroke-linecap="null" stroke-linejoin="null" stroke-width="0"/>
        <path d="m53.47787,30.5c0,0.89247 -0.26893,1.43099 0.00898,1.8557c0.26054,0.39819 0.59847,0.60822 0.83569,1.04415c0.22223,0.40836 0.71352,0.63523 1.07591,0.89319c0.45221,0.32188 0.3836,0.83813 0.84089,1.08278c0.47556,0.25445 0.84352,0.23333 1.43399,0.54177c0.55649,0.29068 1.0224,0.23824 1.61899,0.54176c0.48575,0.24712 0.86457,0.54175 1.61336,0.54175c0.68449,0 1.52789,-0.07233 2.11848,0.19106c0.61258,0.27319 1.24507,0.35069 1.9873,0.35069c0.72203,0 1.52231,0.11403 2.21712,0c0.60069,-0.09858 0.84554,-0.39976 1.45698,-0.58797c0.60303,-0.18564 1.15526,-0.52792 1.60104,-0.80687c0.40089,-0.25086 0.71902,-0.53219 1.14641,-0.77219c0.44809,-0.25162 0.85264,-0.42981 1.33716,-0.73281c0.44221,-0.27655 0.67615,-0.60155 0.89007,-1.04632c0.19946,-0.4147 0.83977,-0.57896 0.83977,-1.04957l0,-0.51215l0,-0.46274l0,-0.48425" fill="#bf0000" id="svg_34" stroke="#000000" stroke-dasharray="null" stroke-linecap="null" stroke-linejoin="null" stroke-width="0"/>
        <ellipse cx="64" cy="55.5" fill="#3f7f00" id="svg_37" rx="4" ry="3.5" stroke="#000000" stroke-dasharray="null" stroke-linecap="null" stroke-linejoin="null" stroke-width="0"/>
        <ellipse cx="63" cy="46.5" fill="#3f7f00" id="svg_38" rx="4" ry="3.5" stroke="#000000" stroke-dasharray="null" stroke-linecap="null" stroke-linejoin="null" stroke-width="0"/>
        <ellipse cx="64.5" cy="66.5" fill="#3f7f00" id="svg_39" rx="4.5" ry="3.5" stroke="#000000" stroke-dasharray="null" stroke-linecap="null" stroke-linejoin="null" stroke-width="0"/>
        <path d="m11.4675,71.715l0,0c0,-9.11256 5.82001,-16.5 13,-16.5c7.1796,0 13,7.38744 13,16.5l-6.5,0c0,-4.55653 -2.91,-8.25 -6.5,-8.25c-3.59,0 -6.5,3.69347 -6.5,8.25l-6.5,0z" fill="#ff007f" id="svg_58" stroke="#bf0000" stroke-dasharray="null" stroke-linecap="null" stroke-linejoin="null" stroke-width="0"/>
        <rect fill="#ff007f" height="31" id="svg_59" stroke="#bf0000" stroke-dasharray="null" stroke-linecap="null" stroke-linejoin="null" stroke-width="0" width="7" x="11.5" y="67.5"/>
        <path d="m19.4739,89.87988c-0.7785,0.49277 -1.49157,0.94414 -2.11434,1.33834c-0.72497,0.45889 -1.30834,1.22768 -2.11328,1.32549c-0.69376,0.08424 -1.10757,-0.21519 -1.88884,0.06104c-0.59553,0.21066 -1.02632,-0.49705 -1.72012,-0.38361l-0.43457,-0.79971l-0.55778,-0.47443" fill="#ffffff" id="svg_61" stroke="#000000" stroke-dasharray="null" stroke-linecap="null" stroke-linejoin="null" stroke-width="0"/>
        <path d="m18.41446,82.61786c-0.7785,0.49278 -1.49158,0.94414 -2.11435,1.33835c-0.72498,0.45888 -1.30835,1.22768 -2.11328,1.32547c-0.69376,0.08424 -1.10754,-0.21519 -1.88882,0.06105c-0.59555,0.21066 -1.02634,-0.49706 -1.72012,-0.38361l-0.43457,-0.79971l-0.55777,-0.47444" fill="#ffffff" id="svg_62" stroke="#000000" stroke-dasharray="null" stroke-linecap="null" stroke-linejoin="null" stroke-width="0"/>
        <path d="m19.41446,71.61786c-0.7785,0.49278 -1.49158,0.94414 -2.11435,1.33835c-0.72498,0.45888 -1.30835,1.22768 -2.11328,1.32547c-0.69376,0.08424 -1.10754,-0.21519 -1.88882,0.06105c-0.59555,0.21066 -1.02634,-0.49706 -1.72012,-0.38361l-0.43457,-0.79971l-0.55777,-0.47444" fill="#ffffff" id="svg_63" stroke="#000000" stroke-dasharray="null" stroke-linecap="null" stroke-linejoin="null" stroke-width="0"/>
        <path d="m324.414,238.618c-0.77802,0.493 -1.491,0.944 -2.11401,1.338c-0.72498,0.459 -1.30798,1.22801 -2.11298,1.326c-0.694,0.084 -1.108,-0.216 -1.88901,0.061c-0.59601,0.20999 -1.026,-0.49701 -1.72,-0.384l-0.435,-0.8l-0.55701,-0.474" fill="#ffffff" id="svg_64" stroke="#000000" stroke-dasharray="null" stroke-linecap="null" stroke-linejoin="null" stroke-width="0"/>
        <path d="m20.41446,62.61786c-0.7785,0.49278 -1.49158,0.94414 -2.11435,1.33835c-0.72498,0.45888 -1.30835,1.22768 -2.11328,1.32547c-0.69376,0.08424 -1.10754,-0.21519 -1.88882,0.06105c-0.59555,0.21066 -1.02634,-0.49706 -1.72012,-0.38361l-0.43457,-0.79971l-0.55777,-0.47444" fill="#ffffff" id="svg_65" stroke="#000000" stroke-dasharray="null" stroke-linecap="null" stroke-linejoin="null" stroke-width="0"/>
        <path d="m29.41446,58.61786c-0.7785,0.49278 -1.49158,0.94414 -2.11435,1.33835c-0.72498,0.45888 -1.30835,1.22768 -2.11328,1.32547c-0.69376,0.08424 -1.10754,-0.21519 -1.88882,0.06105c-0.59555,0.21066 -1.02634,-0.49706 -1.72012,-0.38361l-0.43457,-0.79971l-0.55777,-0.47444" fill="#ffffff" id="svg_66" stroke="#000000" stroke-dasharray="null" stroke-linecap="null" stroke-linejoin="null" stroke-width="0" transform="rotate(81.5909 25 60)"/>
        <path d="m36.41446,61.61786c-0.7785,0.49277 -1.49158,0.94414 -2.11435,1.33833c-0.72498,0.45889 -1.30835,1.22768 -2.11328,1.32549c-0.69376,0.08424 -1.10754,-0.21519 -1.88882,0.06105c-0.59555,0.21066 -1.02634,-0.49706 -1.72012,-0.38362l-0.43457,-0.79971l-0.55777,-0.47443" fill="#ffffff" id="svg_67" stroke="#000000" stroke-dasharray="null" stroke-linecap="null" stroke-linejoin="null" stroke-width="0" transform="rotate(102.65 32 63)"/>
   
</svg>
<svg style="margin-left: -0.5cm; width:15%; heighth:20%">
        <ellipse cx="57" cy="94.5" fill="#ffffff" id="svg_1" rx="28.5" ry="23" stroke="#000000" stroke-dasharray="null" stroke-linecap="null" stroke-linejoin="null" stroke-width="0"/>
        <ellipse cx="57" cy="45" fill="#ffffff" id="svg_3" rx="17.5" ry="18" stroke="#000000" stroke-dasharray="null" stroke-linecap="null" stroke-linejoin="null" stroke-width="0"/>
        <ellipse cx="57" cy="71" fill="#ffffff" id="svg_4" rx="20.5" ry="19" stroke="#000000" stroke-dasharray="null" stroke-linecap="null" stroke-linejoin="null" stroke-width="0"/>
        <circle cx="52" cy="40" fill="#000000" id="svg_8" r="3" stroke="#000000" stroke-dasharray="null" stroke-linecap="null" stroke-linejoin="null" stroke-width="0"/>
        <path d="m53.99069,43.22264l14.47956,1.61105l-14.01161,3.21693l-0.46795,-4.82798z" fill="#000000" id="svg_10" stroke="#000000" stroke-dasharray="null" stroke-linecap="null" stroke-linejoin="null" stroke-width="0"/>
        <path d="m46.75,49.85887c0.03252,1 0.67883,1.38803 1.61618,2c0.952,0.62158 1.99336,0.37845 3.00764,1.01066c1.01189,0.63069 0.89159,1.1038 1.61618,1.63668c0.69111,0.50826 1.80204,1.00257 3.12705,1.35265c1.26054,0.33307 2.82393,0.4173 4.1228,0c0.87036,-0.27965 1.40152,-1.07855 2.16632,-1.57466c0.8138,-0.52789 1.56,-1 2.62078,-1.424l0.44304,-0.576l0.78,-0.42533" fill="#000000" id="svg_13" stroke="#000000" stroke-dasharray="null" stroke-linecap="null" stroke-linejoin="null" stroke-width="0"/>
        <circle cx="56" cy="81" fill="#000000" id="svg_14" r="4" stroke="#000000" stroke-dasharray="null" stroke-linecap="null" stroke-linejoin="null" stroke-width="0"/>
        <circle cx="57" cy="68" fill="#000000" id="svg_15" r="4" stroke="#000000" stroke-dasharray="null" stroke-linecap="null" stroke-linejoin="null" stroke-width="0"/>
        <rect fill="#000000" height="20" id="svg_17" stroke="#000000" stroke-dasharray="null" stroke-linecap="null" stroke-linejoin="null" stroke-width="0" width="18" x="48" y="7"/>
        <rect fill="#000000" height="8" id="svg_18" stroke="#000000" stroke-dasharray="null" stroke-linecap="null" stroke-linejoin="null" stroke-width="0" width="32" x="41" y="25"/>
        <circle cx="62" cy="39" fill="#000000" id="svg_19" r="3" stroke="#000000" stroke-dasharray="null" stroke-linecap="null" stroke-linejoin="null" stroke-width="0"/>
        <polygon cx="157.5" cy="224.5" fill="#000000" id="svg_22" orient="point" point="5" r="0" r2="0" shape="star" strokeWidth="0" strokecolor="#000000"/>
        <polygon cx="146.5" cy="137.5" fill="#ffffff" id="svg_23" orient="point" point="5" points="100.269 11.5591 97.6597 21.3347 106.149 27.4952 95.8126 27.7131 92.7972 37.3604 89.018 27.7195 78.6648 27.5214 86.6659 21.3451 83.2826 11.5753 92.0067 17.399 100.269 11.5591 97.6597 21.3347" r="17.49921" r2="6.99968" shape="star" stroke="#000000" stroke-width="0" strokeWidth="0" strokecolor="#000000"/>
        <polygon cx="146.5" cy="137.5" fill="#ffffff" id="svg_24" orient="point" point="5" points="98.8619 11.0994 96.2526 20.8749 104.742 27.0354 94.4055 27.2533 91.3901 36.9006 87.611 27.2598 77.2578 27.0616 85.2588 20.8853 81.8755 11.1156 90.5997 16.9393 98.8619 11.0994 96.2526 20.8749" r="17.49921" r2="6.99968" shape="star" stroke="#000000" stroke-width="0" strokeWidth="0" strokecolor="#000000" transform="rotate(29.4072 91 24)"/>
        <polygon cx="146.5" cy="137.5" fill="#ffffff" id="svg_25" orient="point" point="5" points="109.862 48.0993 107.253 57.875 115.742 64.0354 105.406 64.2534 102.39 73.9007 98.6111 64.2598 88.2579 64.0616 96.259 57.8853 92.8757 48.1156 101.6 53.9393 109.862 48.0993 107.253 57.875" r="17.49921" r2="6.99968" shape="star" stroke="#000000" stroke-width="0" strokeWidth="0" strokecolor="#000000"/>
        <polygon cx="146.5" cy="137.5" fill="#ffffff" id="svg_26" orient="point" point="5" points="108.862 49.0993 106.253 58.875 114.742 65.0354 104.406 65.2534 101.39 74.9007 97.6111 65.2598 87.2579 65.0616 95.259 58.8853 91.8757 49.1156 100.6 54.9393 108.862 49.0993 106.253 58.875" r="17.49921" r2="6.99968" shape="star" stroke="#000000" stroke-width="0" strokeWidth="0" strokecolor="#000000" transform="rotate(37.3332 101 62)"/>
        <polygon cx="146.5" cy="137.5" fill="#ffffff" id="svg_27" orient="point" point="5" points="28.8621 16.0993 26.2528 25.875 34.7421 32.0354 24.4057 32.2534 21.3903 41.9007 17.6111 32.2598 7.2579 32.0616 15.259 25.8853 11.8757 16.1156 20.5998 21.9393 28.8621 16.0993 26.2528 25.875" r="17.49921" r2="6.99968" shape="star" stroke="#000000" stroke-width="0" strokeWidth="0" strokecolor="#000000"/>
        <polygon cx="146.5" cy="137.5" fill="#ffffff" id="svg_28" orient="point" point="5" points="28.8621 16.0993 26.2528 25.875 34.7421 32.0354 24.4057 32.2534 21.3903 41.9007 17.6111 32.2598 7.2579 32.0616 15.259 25.8853 11.8757 16.1156 20.5998 21.9393 28.8621 16.0993 26.2528 25.875" r="17.49921" r2="6.99968" shape="star" stroke="#000000" stroke-width="0" strokeWidth="0" strokecolor="#000000" transform="rotate(38.1183 21 29)"/>
</svg>
<svg>
        <rect fill="#aad4ff" height="64" id="svg_9" stroke="#aad4ff" stroke-width="5" width="4" x="55.03951" y="31.3213"/>
        <rect fill="#aad4ff" height="66" id="svg_12" stroke="#aad4ff" stroke-dasharray="null" stroke-linecap="null" stroke-linejoin="null" stroke-width="5" transform="rotate(61.6997 59.039 58.321)" width="4" x="57.039" y="25.321"/>
        <rect fill="#aad4ff" height="66" id="svg_13" stroke="#aad4ff" stroke-dasharray="null" stroke-linecap="null" stroke-linejoin="null" stroke-width="5" transform="rotate(-60.0184 60.039 61.321)" width="4" x="58.039" y="28.321"/>
        <path d="m56.04588,34.85889l3.90031,-3.24545l-7.54106,0l-7.54105,0l0,-2.00908l0,-2.00909l7.45453,0c4.09998,0 7.45453,-0.10184 7.45453,-0.22629c0,-0.12447 -1.6322,-1.58492 -3.62709,-3.24545l-3.62711,-3.01917l3.35255,0l3.35254,0l5.12007,4.25407l5.12009,4.25407l-5.1299,4.24593l-5.1299,4.24593l-3.52943,0l-3.52942,0l3.90031,-3.24544l0,0l0.00002,-0.00003z" fill="#aad4ff" id="svg_14" stroke="#aad4ff" stroke-dasharray="null" stroke-linecap="null" stroke-linejoin="null" stroke-width="5" transform="rotate(90 57.1641 29.6044)"/>
        <path d="m24.42126,80.07585l3.9003,-3.24545l-7.54105,0l-7.54105,0l0,-2.00909l0,-2.00908l7.45454,0c4.09996,0 7.45451,-0.10184 7.45451,-0.22629c0,-0.12447 -1.63219,-1.58492 -3.62709,-3.24545l-3.62711,-3.01917l3.35255,0l3.35254,0l5.12009,4.25407l5.12007,4.25406l-5.1299,4.24594l-5.1299,4.24593l-3.52942,0l-3.52943,0l3.90033,-3.24545l0,0l0,-0.00002z" fill="#aad4ff" id="svg_15" stroke="#aad4ff" stroke-dasharray="null" stroke-linecap="null" stroke-linejoin="null" stroke-width="5" transform="rotate(-30.3236 25.5395 74.8213)"/>
        <path d="m24.42126,46.07585l3.9003,-3.24545l-7.54105,0l-7.54105,0l0,-2.00909l0,-2.00908l7.45454,0c4.09996,0 7.45451,-0.10184 7.45451,-0.22629c0,-0.12447 -1.63219,-1.58492 -3.62709,-3.24545l-3.62711,-3.01917l3.35255,0l3.35254,0l5.12009,4.25407l5.12007,4.25406l-5.1299,4.24594l-5.1299,4.24593l-3.52942,0l-3.52943,0l3.90033,-3.24545l0,0l0,-0.00002z" fill="#aad4ff" id="svg_16" stroke="#aad4ff" stroke-dasharray="null" stroke-linecap="null" stroke-linejoin="null" stroke-width="5" transform="rotate(29.2192 25.5395 40.8213)"/>
        <path d="m86.42126,81.07585l3.9003,-3.24545l-7.54105,0l-7.54105,0l0,-2.00909l0,-2.00908l7.45454,0c4.09996,0 7.45451,-0.10184 7.45451,-0.22629c0,-0.12447 -1.63219,-1.58492 -3.62709,-3.24545l-3.62711,-3.01917l3.35255,0l3.35254,0l5.12009,4.25407l5.12007,4.25406l-5.1299,4.24594l-5.1299,4.24593l-3.52942,0l-3.52943,0l3.90033,-3.24545l0,0l0,-0.00002z" fill="#aad4ff" id="svg_17" stroke="#aad4ff" stroke-dasharray="null" stroke-linecap="null" stroke-linejoin="null" stroke-width="5" transform="rotate(-148.092 87.5395 75.8213)"/>
        <path d="m85.42126,49.07585l3.9003,-3.24545l-7.54105,0l-7.54105,0l0,-2.00909l0,-2.00908l7.45454,0c4.09996,0 7.45451,-0.10184 7.45451,-0.22629c0,-0.12447 -1.63219,-1.58492 -3.62709,-3.24545l-3.62711,-3.01917l3.35255,0l3.35254,0l5.12009,4.25407l5.12007,4.25406l-5.1299,4.24594l-5.1299,4.24593l-3.52942,0l-3.52943,0l3.90033,-3.24545l0,0l0,-0.00002z" fill="#aad4ff" id="svg_18" stroke="#aad4ff" stroke-dasharray="null" stroke-linecap="null" stroke-linejoin="null" stroke-width="5" transform="rotate(151.144 86.5395 43.8213)"/>
        <path d="m55.42126,96.07584l3.9003,-3.24545l-7.54105,0l-7.54105,0l0,-2.00909l0,-2.00909l7.45454,0c4.09996,0 7.45451,-0.10181 7.45451,-0.22629c0,-0.12445 -1.63219,-1.5849 -3.62709,-3.24544l-3.62711,-3.01917l3.35255,0l3.35254,0l5.12009,4.25407l5.12007,4.25406l-5.1299,4.24594l-5.1299,4.24594l-3.52942,0l-3.52943,0l3.90033,-3.24545l0,0l0,-0.00003z" fill="#aad4ff" id="svg_19" stroke="#aad4ff" stroke-dasharray="null" stroke-linecap="null" stroke-linejoin="null" stroke-width="5" style="vector-effect: non-scaling-stroke;" transform="rotate(-90 56.5395 90.8213)"/>
    
</svg>

<svg style="margin-left: -5cm; width:15%; heighth:20%">
        <circle cx="65" cy="100.66667" fill="#ffaaaa" id="svg_6" r="21.01666" stroke="#000000" stroke-width="0"/>
        <path d="m71.3875,75.2375c0,0.92047 -3.35786,1.66667 -7.5,1.66667m7.5,-1.66667l0,0c0,0.92047 -3.35786,1.66667 -7.5,1.66667c-4.14212,0 -7.5,-0.7462 -7.5,-1.66667m0,0l0,0c0,-0.92047 3.35786,-1.66667 7.5,-1.66667c4.14214,0 7.5,0.74619 7.5,1.66667l0,6.66667c0,0.92047 -3.35786,1.66666 -7.5,1.66666c-4.14212,0 -7.5,-0.74619 -7.5,-1.66666l0,-6.66667z" fill="#7f7f7f" id="svg_10" stroke="#000000" stroke-dasharray="null" stroke-linecap="null" stroke-linejoin="null" stroke-width="0"/>
        <ellipse cx="83.96245" cy="101.46835" fill="#ffffff" id="svg_11" rx="4.85842" ry="9.70972" stroke="#000000" stroke-dasharray="null" stroke-linecap="null" stroke-linejoin="null" stroke-width="0" transform="matrix(0.720865 -0.502862 0.550479 0.658509 -42.3263 67.1259)"/>
        <line fill="none" id="svg_12" stroke="#ffaa00" stroke-dasharray="null" stroke-linecap="null" stroke-linejoin="null" transform="matrix(0.999816 0.0191837 -0.0191837 0.999816 1.08041 -1.18759) matrix(0.999841 0.0146119 -0.0178543 0.818264 1.39765 14.1248)" x1="65.14143" x2="61.99875" y1="70.66409" y2="6.64496"/>
        <circle cx="103.05556" cy="75.72222" fill="#ffaad4" id="svg_13" r="16.97056" stroke="#ffaa00" stroke-dasharray="null" stroke-linecap="null" stroke-linejoin="null" stroke-width="0"/>
        <path d="m107.31526,55.07362c0,0.64433 -2.35049,1.16666 -5.24998,1.16666m5.24998,-1.16666l0,0c0,0.64433 -2.35049,1.16666 -5.24998,1.16666c-2.89949,0 -5.25,-0.52232 -5.25,-1.16666m0,0l0,0c0,-0.64433 2.35051,-1.16666 5.25,-1.16666c2.89949,0 5.24998,0.52232 5.24998,1.16666l0,4.66664c0,0.64433 -2.35049,1.16667 -5.24998,1.16667c-2.89949,0 -5.25,-0.52234 -5.25,-1.16667l0,-4.66664z" fill="#3f3f3f" id="svg_14" stroke="#000000" stroke-dasharray="null" stroke-linecap="null" stroke-linejoin="null" stroke-width="0"/>
        <ellipse cx="109.42824" cy="71.80946" fill="#ffffff" id="svg_15" rx="2.86811" ry="7.65954" stroke="#000000" stroke-dasharray="null" stroke-linecap="null" stroke-linejoin="null" stroke-width="0" transform="rotate(-34.5089 109.428 71.8095)"/>
        <line fill="none" id="svg_17" stroke="#ffaa00" stroke-dasharray="null" stroke-linecap="null" stroke-linejoin="null" x1="102.05556" x2="102.05556" y1="17.72222" y2="53.72222"/>
        <circle cx="35.05556" cy="74.72222" fill="#00007f" id="svg_18" r="13.60147" stroke="#ffaa00" stroke-dasharray="null" stroke-linecap="null" stroke-linejoin="null" stroke-width="0"/>
        <path d="m38.58528,57.81696c0,0.55229 -2.01472,1 -4.5,1m4.5,-1l0,0c0,0.55229 -2.01472,1 -4.5,1c-2.48528,0 -4.5,-0.44771 -4.5,-1m0,0l0,0c0,-0.55228 2.01472,-1 4.5,-1c2.48528,0 4.5,0.44772 4.5,1l0,4c0,0.55229 -2.01472,1 -4.5,1c-2.48528,0 -4.5,-0.44771 -4.5,-1l0,-4z" fill="#3f3f3f" id="svg_20" stroke="#ffaa00" stroke-dasharray="null" stroke-linecap="null" stroke-linejoin="null" stroke-width="0"/>
        <ellipse cx="38.94319" cy="70.04245" fill="#ffffff" id="svg_21" rx="1.887" ry="5.894" stroke="#ffaa00" stroke-dasharray="null" stroke-linecap="null" stroke-linejoin="null" stroke-width="0" transform="rotate(-32.0054 38.9432 70.0424)"/>
        <line fill="none" id="svg_22" stroke="#ffaa00" stroke-dasharray="null" stroke-linecap="null" stroke-linejoin="null" x1="34.05556" x2="34.05556" y1="10.72222" y2="56.72222"/>
</svg>
<svg>
        <ellipse cx="91.90924" cy="47.7753" fill="#e5a467" id="svg_14" rx="7.48396" ry="15.53291" stroke="#844e1b" stroke-dasharray="null" stroke-linecap="null" stroke-linejoin="null" stroke-width="4" transform="matrix(0.993151 0.116841 -0.116841 0.993151 6.17318 -10.6635) matrix(0.694452 0.805818 -0.814186 0.687314 68.9941 -60.5706)"/>
        <ellipse cx="194.06794" cy="11.32085" fill="#e5a467" id="svg_16" rx="8.40821" ry="15.88318" stroke="#844e1b" stroke-dasharray="null" stroke-linecap="null" stroke-linejoin="null" stroke-width="4" transform="matrix(0.666469 -0.745533 0.745533 0.666469 -109.241 184.461)"/>
        <ellipse cx="61.03949" cy="70.8213" fill="#e5a467" id="svg_17" rx="25.5" ry="36" stroke="#844e1b" stroke-dasharray="null" stroke-linecap="null" stroke-linejoin="null" stroke-width="4"/>
        <ellipse cx="61.03949" cy="98.82131" fill="#fce2c9" id="svg_18" rx="41" ry="25" stroke="#844e1b" stroke-dasharray="null" stroke-linecap="null" stroke-linejoin="null" stroke-width="4"/>
        <circle cx="60.5395" cy="76.3213" fill="#ff0000" id="svg_19" r="11.85756" stroke="#ad2e2e" stroke-dasharray="null" stroke-linecap="null" stroke-linejoin="null"/>
        <ellipse cx="63.76208" cy="71.03827" fill="#ff7070" id="svg_20" rx="6.52726" ry="3.08251" stroke="#ad2e2e" stroke-dasharray="null" stroke-linecap="null" stroke-linejoin="null" stroke-width="0" transform="matrix(0.890638 0.454713 -0.454713 0.890638 40.1674 -19.5151)"/>
        <ellipse cx="54.0395" cy="59.8213" fill="#844e1b" id="svg_22" rx="2" ry="8" stroke="#844e1b" stroke-dasharray="null" stroke-linecap="null" stroke-linejoin="null" stroke-width="4"/>
        <ellipse cx="66.0395" cy="59.8213" fill="#844e1b" id="svg_23" rx="2" ry="8" stroke="#844e1b" stroke-dasharray="null" stroke-linecap="null" stroke-linejoin="null" stroke-width="4"/>
        <ellipse cx="54.1542" cy="61.98641" fill="#ffffff" id="svg_24" rx="1" ry="4.02561" stroke="#844e1b" stroke-dasharray="null" stroke-linecap="null" stroke-linejoin="null" stroke-width="0" transform="rotate(-6.20264 54.154 61.986)"/>
        <ellipse cx="66.26888" cy="61.90385" fill="#ffffff" id="svg_25" rx="1" ry="4.02561" stroke="#844e1b" stroke-dasharray="null" stroke-linecap="null" stroke-linejoin="null" stroke-width="0" transform="rotate(-5.66667 66.2689 61.9039)"/>
        <path d="m101.04052,46.23835l7.61225,-4.27906l-14.71793,0l-14.71788,0l0,-2.64894l0,-2.64895l14.54906,0c8.00195,0 14.54901,-0.13426 14.54901,-0.29836c0,-0.16409 -3.18555,-2.08967 -7.079,-4.27906l-7.07903,-3.98072l6.54317,0l6.54317,0l9.99288,5.60891l9.99287,5.60891l-10.01204,5.59817l-10.01205,5.59818l-6.88836,0l-6.8884,0l7.61227,-4.27906l0,0l0,-0.00001z" fill="#bf7433" id="svg_28" stroke="#844e1b" stroke-dasharray="null" stroke-linecap="null" stroke-linejoin="null" stroke-width="4" transform="matrix(-0.529993 0.848002 -0.848002 -0.529993 173.588 -35.1868)"/>
        <path d="m36.07443,31.16633l6.48299,-5.13887l-12.53456,0l-12.53453,0l0,-3.18119l0,-3.18121l12.39073,0c6.8149,0 12.39073,-0.16123 12.39073,-0.35831c0,-0.19706 -2.71299,-2.50955 -6.02886,-5.13885l-6.02887,-4.78056l5.57251,0l5.57251,0l8.51048,6.73591l8.51047,6.73591l-8.5268,6.72302l-8.52678,6.72302l-5.86653,0l-5.86651,0l6.48301,-5.13886l0,0l0,-0.00001z" fill="#bf7433" id="svg_30" stroke="#844e1b" stroke-dasharray="null" stroke-linecap="null" stroke-linejoin="null" stroke-width="4" transform="matrix(0.57808 0.81598 -0.81598 0.57808 37.2063 -14.3637)"/>
        <path d="m432.26376,213.01474c0,0.91359 -0.0155,1.76918 -0.14188,2.6568c-0.12277,0.8625 -0.42368,1.71954 -0.56885,2.57773c-0.14658,0.86656 -0.065,1.76297 -0.41882,2.57683c-0.33392,0.76814 -0.98874,1.40736 -1.66583,1.87297c-0.72162,0.49623 -1.60229,0.54416 -2.44675,0.68571l-0.98004,0.00034l-0.84845,-0.0089l-0.87967,-0.23802" fill="none" id="svg_33" stroke="#000000" stroke-dasharray="null" stroke-linecap="null" stroke-linejoin="null" stroke-width="0"/>
        <path d="m388.06625,205.11351c0.57315,1.11803 0.76648,1.89371 1.04984,2.78951c0.25171,0.79576 0.50027,1.58638 0.70547,2.3316c0.29623,1.07579 0.51379,1.8893 0.73849,2.69194c0.293,1.04655 0.50864,1.79678 0.72662,2.48563c0.30396,0.96054 0.6041,1.80745 0.77957,2.71721c0.17081,0.88556 0.24472,1.54312 0.34564,2.21176c0.19336,1.28032 0.33777,2.14529 0.49387,2.93005c0.18735,0.94185 0.37726,1.7939 0.53262,2.83493l0.0448,0.62482l0.05627,1.0163l0.30453,0.88757" fill="none" id="svg_35" stroke="#000000" stroke-dasharray="null" stroke-linecap="null" stroke-linejoin="null" stroke-width="0"/>
        <path d="m41.99664,98.52757c0.52042,0.66599 1.1666,1.23698 1.88986,1.79985c0.63251,0.49223 1.37534,1.14177 2.04996,1.61771c0.74371,0.52467 1.46042,1.06332 2.2088,1.46321c0.74997,0.40073 1.53439,0.64677 2.43274,1.07426c0.80942,0.38516 1.60748,0.88597 2.46487,1.11092c0.85275,0.22372 1.68393,0.31395 2.64969,0.51505c0.81186,0.16905 1.66284,0.23874 2.48862,0.37181c1.03189,0.16628 1.82867,0.31749 2.73471,0.36255c0.91016,0.04526 1.78342,0.00281 2.62656,0c0.92569,-0.00311 1.78818,-0.14178 2.64679,-0.29776c0.8595,-0.15614 1.77954,-0.34242 2.55328,-0.57068c0.84949,-0.25061 1.75656,-0.51776 2.64801,-0.78619c0.86752,-0.26123 1.65414,-0.44624 2.50183,-0.71893c0.87964,-0.28296 1.72034,-0.61212 2.54993,-0.87958c0.84512,-0.27246 1.72464,-0.62335 2.51517,-0.93433c0.82755,-0.32553 1.70755,-0.61053 2.4035,-1.13809c0.67529,-0.5119 1.32877,-1.19142 1.9064,-1.83789c0.58939,-0.65958 1.03598,-1.4079 1.40732,-2.21613l0.30478,-0.82788" fill="none" id="svg_41" stroke="#000000" stroke-dasharray="null" stroke-linecap="null" stroke-linejoin="null" stroke-width="2"/>
        <path d="m81.30551,89.67227c0.11877,0.88553 0.43094,1.71037 0.82739,2.51254c0.36469,0.7379 0.71542,1.60063 1.20285,2.32776c0.50122,0.74771 0.9407,1.55081 1.58746,2.12515c0.65704,0.58348 1.41055,1.05196 2.17496,1.43901c0.80341,0.4068 1.69238,0.4323 2.56586,0.45084c0.8981,0.01904 1.78,0.21584 2.65884,0.21373l0.86679,-0.17564l0.90665,-0.03809" fill="none" id="svg_42" stroke="#000000" stroke-dasharray="null" stroke-linecap="null" stroke-linejoin="null"/>
        <path d="m45.80444,89.96817c-0.108,0.88193 -0.34232,1.685 -0.69971,2.53105c-0.34857,0.82512 -0.50888,1.70624 -0.90521,2.51402c-0.38644,0.78766 -0.85291,1.52904 -1.27847,2.27115c-0.44507,0.77617 -1.09036,1.39336 -1.8165,1.86305c-0.729,0.47156 -1.55649,0.78023 -2.33728,1.18947c-0.74417,0.39006 -1.5459,0.75435 -2.31949,1.12613l-0.81253,0.36618l-0.81354,0.24016" fill="none" id="svg_43" stroke="#000000" stroke-dasharray="null" stroke-linecap="null" stroke-linejoin="null"/> 
</svg>
<svg style="margin-left: -5cm; width:15%; heighth:20%">
        <rect fill="#ff0000" height="42" id="svg_1" stroke="#ff0000" stroke-dasharray="null" stroke-linecap="null" stroke-linejoin="null" stroke-width="5" transform="rotate(-5.31454 43.0395 59.3213)" width="20" x="33.03951" y="38.3213"/>
        <ellipse cx="35.23692" cy="88.48191" fill="#ff0000" id="svg_2" rx="8.69857" ry="20.55744" stroke="#ff0000" stroke-dasharray="null" stroke-linecap="null" stroke-linejoin="null" stroke-width="5" transform="rotate(82.7187 35.2369 88.4819)"/>
        <ellipse cx="46.03951" cy="84.3213" fill="#ff0000" id="svg_3" rx="9" ry="8" stroke="#ff0000" stroke-dasharray="null" stroke-linecap="null" stroke-linejoin="null" stroke-width="5"/>
        <path d="m44.44742,16.54321c-0.08241,0.00291 -0.16205,0.0107 -0.2448,0.01993c-1.32402,0.14774 -2.49261,1.0891 -3.08627,2.49178l-0.31474,1.06148c0.0679,-0.36786 0.17216,-0.72461 0.31474,-1.06148c-1.05872,-1.22888 -2.54472,-1.79608 -4.01303,-1.52995c-1.46831,0.26614 -2.74348,1.33342 -3.44035,2.88049c-1.96733,-1.35745 -4.41963,-1.27524 -6.3168,0.21428c-1.89717,1.48952 -2.90836,4.12683 -2.60104,6.78758l0.2011,1.08144c-0.09087,-0.35429 -0.15874,-0.71472 -0.2011,-1.08144l-0.03059,0.09967c-1.64914,0.20134 -3.00163,1.63483 -3.35294,3.55327c-0.3513,1.91843 0.37918,3.88687 1.8098,4.87888l2.23383,0.60799c-0.78,0.07193 -1.55872,-0.13986 -2.23383,-0.60799c-1.10347,1.38478 -1.35741,3.43494 -0.62949,5.12805c0.72791,1.69313 2.28247,2.66803 3.88625,2.44693l0.97484,-0.28905c-0.31366,0.14708 -0.6394,0.2428 -0.97484,0.28905c0.91045,1.8777 2.4201,3.24742 4.19226,3.79247c1.77216,0.54504 3.65448,0.22292 5.22394,-0.89204c1.28035,2.26204 3.55281,3.45016 5.83156,3.04991c2.27876,-0.40025 4.15852,-2.31953 4.82613,-4.92372l0.23169,-1.4552c-0.03468,0.49437 -0.10997,0.98041 -0.23169,1.4552c1.56737,1.1515 3.53893,1.2164 5.15836,0.16943c1.61945,-1.04697 2.62993,-3.04338 2.64476,-5.21776l-0.58058,-3.24884l-2.28712,-2.19817c1.76852,1.24109 2.88348,3.13203 2.86771,5.44701c2.10286,0.02469 3.88907,-1.99399 4.6906,-4.31076c0.80154,-2.31679 0.49832,-4.95804 -0.79561,-6.94208c0.53671,-1.47719 0.50487,-3.15749 -0.08742,-4.60478c-0.5923,-1.4473 -1.68481,-2.52299 -2.99884,-2.94527c-0.29407,-1.91823 -1.5062,-3.46123 -3.10814,-3.9669c-1.60194,-0.50568 -3.30769,0.11787 -4.38023,1.60471l-0.65134,1.23093c0.16643,-0.44513 0.3838,-0.86005 0.65134,-1.23093c-0.75604,-1.16855 -1.94188,-1.82791 -3.17807,-1.78412l0,0l-0.00002,0.00002z" fill="#ffffff" id="svg_5" stroke="#000000" stroke-dasharray="null" stroke-linecap="null" stroke-linejoin="null"/>
        <path d="m48.30931,68.93488l3.05576,0l0.94424,-2.90294l0.94424,2.90294l3.05576,0l-2.47215,1.7941l0.94431,2.90295l-2.47215,-1.79414l-2.47215,1.79414l0.94431,-2.90295l-2.47215,-1.7941z" fill="#007f00" id="svg_8" stroke="#007f00" stroke-dasharray="null" stroke-linecap="null" stroke-linejoin="null"/>
        <path d="m35.53954,63.92426l3.05576,0l0.94424,-2.90294l0.94426,2.90294l3.05574,0l-2.47215,1.7941l0.94431,2.90295l-2.47215,-1.79414l-2.47215,1.79414l0.94431,-2.90295l-2.47215,-1.7941z" fill="#007f00" id="svg_9" stroke="#007f00" stroke-dasharray="null" stroke-linecap="null" stroke-linejoin="null"/>
        <path d="m39.56866,75.46794l3.05574,0l0.94426,-2.90295l0.94424,2.90295l3.05576,0l-2.47215,1.7941l0.94431,2.90295l-2.47215,-1.79416l-2.47215,1.79416l0.94431,-2.90295l-2.47215,-1.7941z" fill="#007f00" id="svg_10" stroke="#007f00" stroke-dasharray="null" stroke-linecap="null" stroke-linejoin="null"/>
        <path d="m25.26118,81.68536c0.75132,0 1.43674,0.17746 1.78376,0.88578c0.2941,0.60031 0.54534,1.14695 0.8494,1.8382c0.31319,0.71198 0.87886,1.05746 1.1715,1.79631c0.24973,0.63054 0.48174,1.28474 0.71177,2.10005c0.22283,0.78979 0.64569,1.45865 0.81109,2.13272c0.20518,0.83618 0,1.66501 0,2.51021c0,0.8281 0,1.66533 0,2.51531l0,0.85645l0,0.81084" fill="none" id="svg_13" stroke="#ffffff" stroke-dasharray="null" stroke-linecap="null" stroke-linejoin="null"/>
        <path d="m52.58157,79.37469c-0.63587,0.4008 -1.37505,0.52559 -1.93446,1.02336c-0.55942,0.49776 -1.28705,0.82242 -1.93448,1.22802c-0.61028,0.38232 -1.24527,0.79294 -1.75563,1.31644c-0.48542,0.49796 -0.94417,1.06735 -1.24458,1.76215c-0.30671,0.70934 -0.26698,1.41334 -0.56092,2.11951c-0.26422,0.63482 -0.3078,1.39668 -0.3078,2.14387c0,0.76302 0,1.52712 0,2.26907c0,0.70441 0,1.46741 0,2.25139l0.12267,0.70496l0.43425,0.59225l0.30284,0.72747" fill="none" id="svg_21" stroke="#ffffff" stroke-dasharray="null" stroke-linecap="null" stroke-linejoin="null" stroke-width="null"/>
        <rect fill="#007f00" height="33.33334" id="svg_22" stroke="#007f00" stroke-dasharray="null" stroke-linecap="null" stroke-linejoin="null" stroke-width="null" transform="rotate(-5.50041 90.4098 73.4673)" width="18.73522" x="81.04218" y="56.80066"/>
        <ellipse cx="85.81915" cy="95.44649" fill="#007f00" id="svg_23" rx="16.80587" ry="8.19841" stroke="#007f00" stroke-dasharray="null" stroke-linecap="null" stroke-linejoin="null" stroke-width="null" transform="matrix(0.987831 -0.155533 0.155533 0.987831 -13.8007 14.5092)"/>
        <circle cx="95.35097" cy="91.35068" fill="#007f00" id="svg_24" r="7.04288" stroke="#007f00" stroke-dasharray="null" stroke-linecap="null" stroke-linejoin="null" stroke-width="null"/>
        <path d="m90.82195,40.02078c-0.06497,0.00232 -0.12775,0.0085 -0.19298,0.01584c-1.04375,0.11739 -1.96498,0.86523 -2.43297,1.97961l-0.24812,0.84331c0.05353,-0.29224 0.13573,-0.57567 0.24812,-0.84331c-0.83459,-0.97629 -2.00604,-1.42691 -3.16354,-1.21548c-1.1575,0.21143 -2.16275,1.05936 -2.71211,2.28844c-1.55087,-1.07843 -3.48407,-1.01312 -4.97966,0.17024c-1.49557,1.18336 -2.29271,3.27861 -2.05045,5.39247l0.15852,0.85915c-0.07162,-0.28146 -0.12514,-0.56781 -0.15852,-0.85915l-0.02412,0.07919c-1.30005,0.15996 -2.36623,1.29881 -2.64319,2.82292c-0.27693,1.52412 0.29892,3.08798 1.42671,3.87608l1.76096,0.48303c-0.61488,0.05714 -1.22876,-0.11111 -1.76096,-0.48303c-0.8699,1.10016 -1.07008,2.72893 -0.49625,4.07405c0.57382,1.34512 1.79932,2.11964 3.06361,1.94398l0.76849,-0.22964c-0.24725,0.11685 -0.50407,0.1929 -0.76849,0.22964c0.71773,1.49176 1.90782,2.57994 3.30484,3.01297c1.39702,0.43301 2.88091,0.17709 4.11813,-0.70871c1.00934,1.79712 2.80075,2.74103 4.59714,2.42305c1.7964,-0.31798 3.27823,-1.84277 3.80453,-3.91171l0.18263,-1.1561c-0.02734,0.39276 -0.08669,0.7789 -0.18263,1.1561c1.23558,0.91483 2.78979,0.96637 4.06644,0.13461c1.27663,-0.83177 2.07321,-2.41786 2.0849,-4.14531l-0.45767,-2.58109l-1.80298,-1.74637c1.39415,0.98602 2.27309,2.4883 2.26065,4.32745c1.65773,0.01961 3.06584,-1.58415 3.69771,-3.42474c0.63185,-1.84058 0.39284,-3.93896 -0.62721,-5.5152c0.4231,-1.17357 0.39799,-2.5085 -0.06891,-3.65834c-0.46692,-1.14981 -1.32817,-2.00443 -2.36406,-2.33989c-0.23181,-1.52396 -1.18735,-2.74982 -2.4502,-3.15155c-1.26283,-0.40175 -2.60753,0.09363 -3.45302,1.27487l-0.51347,0.97792c0.1312,-0.35364 0.30257,-0.68327 0.51347,-0.97792c-0.59601,-0.92836 -1.53084,-1.45221 -2.50534,-1.4174l0,0l-0.00002,0z" fill="#ffffff" id="svg_25" stroke="#000000" stroke-dasharray="null" stroke-linecap="null" stroke-linejoin="null"/>
        <path d="m94.55727,80.6163l1.71672,0l0.53047,-1.63087l0.53049,1.63087l1.71671,0l-1.38885,1.00792l0.5305,1.63087l-1.38885,-1.00795l-1.38884,1.00795l0.5305,-1.63087l-1.38885,-1.00792l0.00002,0z" fill="#ff0000" id="svg_27" stroke="#ff0000" stroke-dasharray="null" stroke-linecap="null" stroke-linejoin="null" stroke-width="null"/>
        <path d="m86.96738,81.44215l1.71672,0l0.53047,-1.63087l0.53049,1.63087l1.71671,0l-1.38885,1.00792l0.53052,1.63086l-1.38885,-1.00795l-1.38885,1.00795l0.53052,-1.63086l-1.38885,-1.00792z" fill="#ff0000" id="svg_28" stroke="#ff0000" stroke-dasharray="null" stroke-linecap="null" stroke-linejoin="null" stroke-width="null"/>
        <path d="m88.18459,75.32309l1.57365,0l0.48627,-1.49496l0.48627,1.49496l1.57365,0l-1.2731,0.92393l0.4863,1.49495l-1.27312,-0.92395l-1.2731,0.92395l0.4863,-1.49495l-1.27312,-0.92393z" fill="#ff0000" id="svg_29" stroke="#ff0000" stroke-dasharray="null" stroke-linecap="null" stroke-linejoin="null" stroke-width="null"/>
        <path d="m101.85622,87.13797c-0.57001,0.38106 -1.39189,0.49202 -2.23334,0.75162c-0.80472,0.24827 -1.5643,0.59454 -2.31827,0.95397c-0.75507,0.35996 -1.31593,0.95312 -1.73347,1.59385c-0.40543,0.62214 -0.75238,1.2981 -1.12332,1.93877c-0.37642,0.65014 -0.63994,1.33304 -0.79161,2.04023c-0.15291,0.7131 -0.09999,1.44562 -0.09999,2.16412c0,0.75201 -0.08333,1.46263 -0.19954,2.14275l-0.00044,0.73838l0.09999,0.6671l0.2,0.67028" fill="none" id="svg_30" stroke="#ffffff" stroke-dasharray="null" stroke-linecap="null" stroke-linejoin="null" stroke-width="null"/>
        <path d="m74.45621,91.73708c0.60991,0 1.2192,-0.05788 1.77409,0.20564c0.56029,0.26608 1.10236,0.63868 1.47738,1.20637c0.39284,0.59468 0.63627,1.31058 0.80894,2.01994c0.17957,0.73769 0.14122,1.50781 0.14122,2.25671c0,0.77077 -0.00399,1.53945 -0.13725,2.269c-0.13394,0.73328 -0.48559,1.36313 -0.86916,1.93028c-0.34493,0.51005 -0.63359,1.14543 -0.98525,1.71586l-0.47153,0.36137" fill="none" id="svg_31" stroke="#ffffff" stroke-dasharray="null" stroke-linecap="null" stroke-linejoin="null" stroke-width="null"/>
  </svg>

            <h1 style= "color: rgb(132,6,6); font-size: 20pt; margin-top: 10;">and a happy new year</h1>
	        </body>   
            <body bgcolor="#2b7028"/>
         
		<form style="margin-top:2cm ;font-size:25pt; color: rgb(132,6,6); font-family:bold;" action="/memory/draw" method="GET" enctype="application/x-www-form-urlencoded">
		 Name: <input type="text" name="fname"></input> 
         Name: <input type="text" name="fname"></input>
         Name: <input type="text" name="fullname"></input>
         Name: <input type="text" name="fullname"></input>
         <button type="submit">Create a new Game</button>
          </form>
	</html>
	
	};

declare   
%rest:path("memory/draw")
%rest:GET 
function memory:draw() {
   let $xslt := doc("./memoryGame.xsl")   
   let $input :=
        <data>
            <element>Element 1</element>
       </data>
   return ($xslt)

}; 


