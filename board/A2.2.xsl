<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <!-- Das hier muss unbedingt bearbeitet werden -->
    <!-- Hier wird die Daten-Datei angelegt--> 
    <!-- Variable, da absolute/relative Werte -->
    <!-- Kartengröße -->
    <xsl:variable name="KartenHoehe" select="250"/>
    <xsl:variable name="KartenBreite" select="250"/>
    
    <!-- Höhe und Breite des Kartenbereichs -->
    <xsl:variable name="height" select="1000"/>
    <xsl:variable name="weighth" select="500"/>
    <xsl:variable name="coloums" select="3"/>
    <xsl:variable name="rows" select="6"/>
    
    <!-- Position und Abmessung des Buttons -->
    <xsl:variable name="Buttonheight" select="50"/>
    <xsl:variable name="Buttonweight" select="50"/>
    <xsl:variable name="posX" select="10"/>
    <xsl:variable name="posY" select="10"/>
    
</xsl:stylesheet>