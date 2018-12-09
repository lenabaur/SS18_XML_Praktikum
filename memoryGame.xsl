<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">    
    <xsl:template match="/">
        
        <link rel="stylesheet" type="text/css" href="styles.css"/>   
        <body bgcolor="#2b7028"/>
        <h1 style =" font-family:'impact';margin-left: 12.5cm; margin-top: 0.5cm; font-size: 23pt; color: rgb(132,6,6); font-weight:bold;">memory</h1>	
        <h1 style =" font-family:'impact'; margin-left: 15.3cm; margin-top:-2.2cm; font-size: 42pt; color: rgb(132,6,6); font-weight:bold;">Christmas</h1>	
       
        <xsl:variable name="cards" select="document('cards.xml')"/>
        <html>
            <head>
                <link rel="stylesheet" type="text/css" href="styles.css"/>   
            </head>
            <body>
              <table style="margin-left: 3cm; width:10%; heighth:20%">
                            <xsl:for-each select="memory/spielfeld/feld">
                                <tr style="margin-right:-2;">
                                    <td>
                                        <svg xmlns="http://www.w3.org/2000/svg" >
                                            <a xlink:title="hallo" xmlns:xlink="http://www.w3.org/1999/xlink"  xlink:href="https://www.google.de">
                                            <xsl:copy-of select="$cards//card[@id=current()/card/text()]/node()"/>
                                            </a>
                                        </svg>
                                    </td>
                                    <td>
                                        <svg xmlns="http://www.w3.org/2000/svg" >
                                            <xsl:copy-of select="$cards//card[@id=current()/card/text()]/node()"/>
                                        </svg>
                                    </td>
                                    <td>
                                        <svg xmlns="http://www.w3.org/2000/svg" >
                                            <xsl:copy-of select="$cards//card[@id=current()/card/text()]/node()"/>
                                        </svg>
                                    </td>
                                    <td>
                                        <svg xmlns="http://www.w3.org/2000/svg" >
                                            <xsl:copy-of select="$cards//card[@id=current()/card/text()]/node()"/>
                                        </svg>
                                    </td>
                                </tr>   
                     
                            </xsl:for-each>   
                        
                    </table>
                   
                    
                    <xsl:variable name="game" select="document('game.xml')"/>
                    <table>
                    <xsl:for-each select="$game/memory/spielerAll/spieler">
                        <tr>
                            <td><xsl:value-of select="spielerName"/></td>
                            <td><xsl:value-of select="punkte"/></td>
                        </tr>
                    </xsl:for-each>
                    </table>
            </body>
        </html>
    </xsl:template>
    
</xsl:stylesheet>