<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:template match ="memory">
        <svg width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" style="min-width:1000px; min-height:1000px" >
            <rect width="100%" height="100%" x="0%" y="0%" fill="#FFF0F5"/>
            <rect width="60%" height="8%" x="23%" y="0%" fill="#E0FFFF"/>
           <!-- <circle width="30%" x="23%" y="20%" fill="#E0FFFF"/>-->
            <ellipse width="30%" height="73%" x="30%" y="20%" fill="#E0FFFF"/>
            <foreignObject xmlns="http://www.w3.org/2000/svg" x="0" y="17%" width="200" height="300">
                <body xmlns="http://www.w3.org/1999/xhtml" style="margin: 0px; height: 100%;">
                    <button type="button" style="width:100%; height:100%;" onclick="alert('Button clicked')">
                        Spiel beginnen!
                    </button>
                </body>
            </foreignObject>
           <!-- Hier ist ein Kreis
           <circle cx="200" cy="200" r="100" fill="#E0FAFF" width="10%"/>-->

            <text stroke-width="0.05%" x="40%" y="5%" fill="#765675" font-size="22pt" font-weight="bold" font-family="Arial, sans-serif">Memory Lounge</text>

            <rect width="20%" height="30%" x="82%" y="15%" fill="#E0FFFF"/>
            <text stroke-width="0.05%" x="83%" y="19%" fill="#765675" font-size="13pt" font-weight="bold" font-family="Arial, sans-serif">Bitte Namen der</text>
            <text stroke-width="0.05%" x="83%" y="21%" fill="#765675" font-size="13pt" font-weight="bold" font-family="Arial, sans-serif">Spieler-/innen eingeben</text>
            
            <svg width="100%" height="500">
                <text stroke-width="0.05%" x="83%" y="48%" fill="#765675" font-size="10pt" font-weight="bold" font-family="Arial, sans-serif">1.</text>
                <foreignObject x="85%" y="45%" width="400" height="400">
                    <div xmlns="http://www.w3.org/1999/xhtml">
                        <input></input>
                    </div>
                </foreignObject>
            </svg>
            <svg width="100%" height="500">
                <text stroke-width="0.05%" x="83%" y="53%" fill="#765675" font-size="10pt" font-weight="bold" font-family="Arial, sans-serif">2.</text>
                <foreignObject x="85%" y="50%" width="400" height="400">
                    <div xmlns="http://www.w3.org/1999/xhtml">
                        <input></input>
                    </div>
                </foreignObject>
            </svg>
            <svg width="100%" height="500">
                <text stroke-width="0.05%" x="83%" y="58%" fill="#765675" font-size="10pt" font-weight="bold" font-family="Arial, sans-serif">3.</text>
                <foreignObject x="85%" y="55%" width="400" height="400">
                    <div xmlns="http://www.w3.org/1999/xhtml">
                        <input></input>
                    </div>
                </foreignObject>
            </svg>
            <svg width="100%" height="500">
                <text stroke-width="0.05%" x="83%" y="63%" fill="#765675" font-size="10pt" font-weight="bold" font-family="Arial, sans-serif">4.</text>
                <foreignObject x="85%" y="60%" width="400" height="450">
                    <div xmlns="http://www.w3.org/1999/xhtml">
                        <input></input>
                    </div>
                </foreignObject>
            </svg>
        </svg>
        
        
    </xsl:template>
</xsl:stylesheet>