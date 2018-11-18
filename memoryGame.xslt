<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
 <xsl:include href="game.xml"/>
 <xsl:include href="cards.xml"/>
    <xsl:template match="/">
        <html>
            <body>          
                    <xsl:for-each select="spielfeld/feld">
                        <tr>
                            <td><xsl:value-of select="../static/cards/card/defs" /></td>
                        </tr>
                    </xsl:for-each>
            </body>
        </html>
    </xsl:template>
    
</xsl:stylesheet>
