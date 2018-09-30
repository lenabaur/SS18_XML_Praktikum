<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">

    <xsl:template match ="memory">
     <svg width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" style="min-width:1000px; min-height:1000px" >
        <rect width="100%" height="100%" x="0%" y="0%" fill="#FFF0F5"/>
        <rect width="60%" height="8%" x="23%" y="0%" fill="#E0FFFF"/>
        <text stroke-width="0.05%" x="40%" y="5%" fill="#765675" font-size="22pt" font-weight="bold" font-family="Arial, sans-serif">Welcome to Memory</text>
        <rect width="20%" height="30%" x="-2%" y="15%" fill="#E0FFFF"/>
        <text stroke-width="0.05%" x="3%" y="19%" fill="#765675" font-size="22pt" font-weight="bold" font-family="Arial, sans-serif">Highscore</text>
        <text stroke-width="0.05%" x="3%" y="25%" fill="#765675" font-size="20pt" font-weight="bold" font-family="Arial, sans-serif">Punkte</text>
        <text stroke-width="0.05%" x="3%" y="29%" fill="#765675" font-size="20pt" font-weight="bold" font-family="Arial, sans-serif">Punkte</text>
        <text stroke-width="0.05%" x="3%" y="33%" fill="#765675" font-size="20pt" font-weight="bold" font-family="Arial, sans-serif">Punkte</text>
        <rect width="20%" height="30%" x="82%" y="15%" fill="#E0FFFF"/>
        <text stroke-width="0.05%" x="83%" y="19%" fill="#765675" font-size="22pt" font-weight="bold" font-family="Arial, sans-serif">Spieler/-innen</text>
         <foreignObject xmlns="http://www.w3.org/2000/svg" x="88%" y="5%" width="93" height="43">
             <body xmlns="http://www.w3.org/1999/xhtml" style="margin: 0px; height: 100%;">
                 <button type="button" style="width:100%; height:100%;" onclick="alert('Button clicked')">
                     Spiel beenden
                 </button>
             </body>
         </foreignObject>
     </svg>
        
        
</xsl:template>
    
</xsl:stylesheet>
