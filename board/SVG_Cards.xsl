<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
 

    <xsl:include href="SVG_Abmessung.xsl"/>
    
    <xsl:template match="/">
        <svg xmlns="http://www.w3.org/2000/svg" width="300" height="300" >
            <defs>
                
                <!-- Rückseite -->
                <a id="back">
                    <defs>
                        <linearGradient id="grad1" x1="0%" y1="0%" x2="0%" y2="100%">
                            <stop offset="0%" style="stop-color:rgb(224,255,255);stop-opacity:1" />
                            <stop offset="100%" style="stop-color:rgb(255,192,037);stop-opacity:1"/>
                        </linearGradient>
                    </defs>
                    <rect width="150" height="150" fill="url(#grad1)" />
                </a>
                
                <!-- Karte Vorderseite ohne Motiv -->
                <a id="blancCard">
                    <rect width="150" height="150" fill="rgb(224,255,255)"  stroke=" black" stroke-width="6" />
                    
                </a>
                
                <!-- Alle Karten Motiv -->
                <a id="bahamamama">
                    
                    <style>
                        .big { font: bold 50px sans-serif;}
                    </style>
                    <text x="40" y="120" stroke="black" fill="rgb(255,192,037)" class="big">BAHAMA
                        <tspan x="70" y="200">MAMA</tspan>
                    </text>
                </a>
            
                <a id="allblue">
                    <rect x="25" y="25" rx="10" ry="10" width="250" height="250" fill="rgb(225,255,255)" stroke=" black" stroke-width="6" />
                    
                </a>
             
                <a id="allyellow">
                    <rect x="25" y="25" rx="10" ry="10" width="250" height="250" fill="rgb(255,192,037)" stroke=" black" stroke-width="6" />
                    
                </a>
           
                <a id="ball">
                    <circle cx="150" cy="150" r="80" fill="rgb(255,192,037)"  stroke=" rgb(225,255,255)" />
                    <ellipse cx="187" cy="68" rx="80" ry="50" fill="rgb(225,255,255)" transform="rotate(30 20,40)"/>
                    <ellipse cx="187" cy="68" rx="80" ry="20" fill="rgb(255,192,037)" transform="rotate(30 20,40)"/>
                    
                </a>
           
                <a id="banana">
                    
                    
                    <path d="M 60 230 q 180 30 180 -150" stroke=" rgb(255,192,037)"
                        stroke-width="5" fill="none" />
                    <path d="M 60 230 q 70 -80 180 -150" stroke=" rgb(255,192,037)"
                        stroke-width="5" fill="none" />
                    <path d="M 60 230 q 70 -0 180 -150" stroke=" rgb(255,192,037)"
                        stroke-width="5" fill="none" />
                </a>
                
                <a id="bars">
                    
                    <path d="M 30 30 l 240 240" stroke="rgb(255,192,037)" stroke-width="6"/>
                    <path d="M 90 30 l 180 180" stroke="rgb(255,192,037)" stroke-width="6"/>
                    <path d="M 150 30 l 120 120" stroke="rgb(255,192,037)" stroke-width="6"/>
                    <path d="M 210 30 l 60 60" stroke="rgb(255,192,037)" stroke-width="6"/>
                    
                    <path d="M 270 30 l -240 240" stroke="rgb(225,255,255)" stroke-width="6"/>
                    <path d="M 210 30 l -180 180" stroke="rgb(225,255,255)" stroke-width="6"/>
                    <path d="M 150 30 l -120 120" stroke="rgb(225,255,255)" stroke-width="6"/>
                    <path d="M 90 30 l -60 60" stroke="rgb(225,255,255)" stroke-width="6"/>
                </a>
                
                <a id="cross">
                    <rect x="75" y="75" rx="10" ry="10" width="150" height="150" fill="rgb(224,255,255)" stroke="rgb(255,192,037)" stroke-width="6" />
                    <path d="M 75 75 l 150 150" stroke="rgb(255,192,037)" stroke-width="6"/>
                    <path d="M 225 75 l -150 150" stroke="rgb(255,192,037)" stroke-width="6"/>
                </a>
            
                <a id="elips">
                    <ellipse cx="150" cy="150" rx="110" ry="40" fill="rgb(255,192,037)" />
                    <ellipse cx="140" cy="150" rx="80" ry="20" fill="rgb(224,255,255)" />
                </a>
               
                <a id="flower">
                    <circle cx="150" cy="100" r="38" fill="rgb(255,192,037)" />
                    <circle cx="150" cy="200" r="38" fill="rgb(255,192,037)" />
                    <circle cx="100" cy="150" r="38" fill="rgb(255,192,037)" />
                    <circle cx="200" cy="150" r="38" fill="rgb(255,192,037)" />
                    <circle cx="150" cy="150" r="30" fill="rgb(224,255,255)" />
                </a>
                
                <a id="tree">
                    <circle cx="150" cy="115" r="50" fill="rgb(225,255,255)"  stroke=" rgb(255,192,037)" stroke-width="3" />
                    <polygon points="150,260 120,150 180,150" style="fill:rgb(255,192,037);stroke:black;stroke-width:2" />
                    <circle cx="125" cy="130" r="35" fill="rgb(225,255,255)"  stroke=" rgb(255,192,037)" stroke-width="3" />
                    <circle cx="175" cy="130" r="30" fill="rgb(225,255,255)"  stroke=" rgb(255,192,037)" stroke-width="3" />       
                </a>
              
                <a id="outline">
                    <rect x="75" y="75" rx="10" ry="10" width="150" height="150" fill="rgb(224,255,255)" fill-opacity="0.4" stroke="rgb(255,192,037)" stroke-width="6" />
                </a>
               
                <a id="quater">
                    <rect x="40" y="40" rx="10" ry="10" width="120" height="120" fill="rgb(224,255,255)" fill-opacity="0.4" stroke="rgb(255,192,037)" stroke-width="6" />
                    <rect x="140" y="40" rx="10" ry="10" width="120" height="120" fill="rgb(224,255,255)" fill-opacity="0.4" stroke="rgb(255,192,037)" stroke-width="6" />
                    <rect x="40" y="140" rx="10" ry="10" width="120" height="120" fill="rgb(224,255,255)" fill-opacity="0.4" stroke="rgb(255,192,037)" stroke-width="6" />
                    <rect x="140" y="140" rx="10" ry="10" width="120" height="120" fill="rgb(224,255,255)" fill-opacity="0.4" stroke="rgb(255,192,037)" stroke-width="6" />
                </a>
               
                <a id="stroke">
                    <rect x="25" y="25" rx="10" ry="10" width="250" height="250" fill="rgb(224,255,255)" fill-opacity="0.4" stroke=" black" stroke-width="6" />
                    
                    <path d="M 30 50 l 240 0" stroke="rgb(225,255,255)" stroke-width="20"/>
                    <path d="M 30 50 l 240 0" stroke="rgb(255,192,037)" stroke-width="4"/>
                    <path d="M 30 100 l 240 0" stroke="rgb(225,255,255)" stroke-width="16"/>
                    <path d="M 30 100 l 240 0" stroke="rgb(255,192,037)" stroke-width="8"/>
                    <path d="M 30 150 l 240 0" stroke="rgb(255,192,037)" stroke-width="12"/>
                    <path d="M 30 200 l 240 0" stroke="rgb(255,192,037)" stroke-width="16"/>
                    <path d="M 30 200 l 240 0" stroke="rgb(225,255,255)" stroke-width="8"/>
                    <path d="M 30 250 l 240 0" stroke="rgb(255,192,037)" stroke-width="20"/>
                    <path d="M 30 250 l 240 0" stroke="rgb(225,255,255)" stroke-width="4"/>
                </a>
                
                <a id="sun">
                    
                    <polygon points="150, 30 130,150 170,150" fill="rgb(255,192,037)" />
                    <polygon points="150, 270 130,150 170,150" fill="rgb(255,192,037)" />
                    <polygon points="30, 150 150,130 150,170" fill="rgb(255,192,037)" />
                    <polygon points="270, 150 150,130 150,170" fill="rgb(255,192,037)" />
                    <polygon points="240, 225 150,130 150,170" fill="rgb(255,192,037)" />
                    <polygon points="240, 75 150,130 150,170" fill="rgb(255,192,037)" />
                    <polygon points="60, 75 150,130 150,170" fill="rgb(255,192,037)" />
                    <polygon points="60, 225 150,130 150,170" fill="rgb(255,192,037)" />
                </a>
                
                <a id="tree">
                    
                    <polygon points="150,130 120,260 180,260" style="fill:rgb(255,192,037);stroke:black;stroke-width:2" />
                    
                    <path d="M 150 130 q -50 -10 -80 70" stroke=" black"
                        stroke-width="5" fill="none" />
                    <path d="M 150 130 q 60 -10 80 70" stroke=" black"
                        stroke-width="5" fill="none" />
                    <path d="M 150 130 q -90 -30 -80 70" stroke=" black"
                        stroke-width="5" fill="none" />
                    <path d="M 150 130 q 100 -50 80 70" stroke=" black"
                        stroke-width="5" fill="none" />
                    <path d="M 150 130 q 60 -50 100 -40" stroke=" black"
                        stroke-width="5" fill="none" />
                    <path d="M 150 130 q -20 -60 100 -40" stroke=" black"
                        stroke-width="5" fill="none" />
                    <path d="M 150 130 q -60 -40 -100 -40" stroke=" black"
                        stroke-width="5" fill="none" />
                    <path d="M 150 130 q -30 -80 -100 -40" stroke=" black"
                        stroke-width="5" fill="none" />
                    <path d="M 150 130 q -40 -80 40 -93" stroke=" black"
                        stroke-width="5" fill="none" />
                    <path d="M 150 130 q 5 -80 40 -93" stroke=" black"
                        stroke-width="5" fill="none" />    
                </a>
                
                <a id="triangel">
                    <polygon points="100,50 140,250 250,210" style="fill:rgb(255,192,037);stroke:black;stroke-width:2" />
                </a>
                
                <a id="waves">
                    <path d="M 30 200 q 200 -160 100 26" stroke="rgb(255,192,037)"
                        stroke-width="7" fill="none" />
                    <path d="M 100 230 q 200 -160 100 26" stroke="rgb(255,192,037)" stroke-width="7" fill="none" />
                    <path d="M 130 180 q 200 -160 100 26" stroke="rgb(255,192,037)" stroke-width="7" fill="none" />
                </a>
                
                <!-- Buttons ohne Motiv -->
                <a id="blancButton">
                    <circle cx="40" cy="40" r="38" stroke="black" stroke-width="3" fill="rgb(255,192,037)" 
                    />
                </a>
                
                <!-- Buttons Motiv-->
                <a id="stats">
                    
                    <style>
                        .big { font: bold 27px sans-serif;}
                    </style>
                    <text x="7" y="48" stroke="black" fill="rgb(225,255,255)" class="big">Stats
                    </text>
                </a>
                
                <a id="start">
                    <style>
                        .big { font: bold 27px sans-serif;}
                    </style>
                    <text x="9" y="48" stroke="black" fill="rgb(225,255,255)" class="big">Start
                    </text>
                </a>
                
                <a id="player">
                    <polygon points="40,25 25,70 55,70" style="fill:rgb(225,255,255);stroke:black;stroke-width:3" />
                    <circle cx="40" cy="25" r="11" stroke="black" stroke-width="3" fill="rgb(225,255,255)" 
                    />
                </a>
                
                <a id="exit">
                    <style>
                        .big { font: bold 27px sans-serif;}
                    </style>
                    <text x="15" y="48" stroke="black" fill="rgb(225,255,255)" class="big">Exit
                    </text>
                </a>
           
            </defs>
            
        </svg>    

    </xsl:template>
    
    
    
</xsl:stylesheet>
