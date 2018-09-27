<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <!-- Höhe und Breite des Kartenbereichs -->
    <xsl:variable name="height" select="'100%'"/>
    <xsl:variable name="weighth" select="'100%'"/>
    <xsl:variable name="coloums" select="3"/>
    <xsl:variable name="rows" select="6"/>
    
    
    <!-- Kartengröße -->
    <xsl:variable name="KartenHoehe" select="150"/>
    <xsl:variable name="KartenBreite" select="150"/>
    <xsl:variable name="KartenAbstandX" select="20"/>
    <xsl:variable name="KartenAbstandY" select="20"/>
    
    <!-- Rahmen -->
    <xsl:variable name="RahmenRx" select="'2%'"/>
    <xsl:variable name="RahmenRy" select="'2%'"/>
    <xsl:variable name="frameStroke" select="'black'"/>
    <xsl:variable name="frameStrokeWidth" select="6"/>
    <xsl:variable name="fill" select="'rgb(224,255,255)'"/>
    <xsl:variable name="frameFillOpacity" select="0.4"/>
    
    <!-- Button blanc-->
    <xsl:variable name="ButtonBlancCX" select="40"/>
    <xsl:variable name="ButtonBlancCY" select="40"/>
    <xsl:variable name="ButtonR" select="38"/>
    <xsl:variable name="ButtonStroke" select="'black'"/>
    <xsl:variable name="ButtonStrokeWidth" select="3"/>
    <xsl:variable name="ButtonFill" select="'rgb(255,192,037)'"/>
    
    <!-- Button Styles-->
    <xsl:variable name="ButtonNamePosX" select="'10%'"/>
    <xsl:variable name="ButtonNamePosY" select="'60%'"/>
    <xsl:variable name="ButtonNameStroke" select="'black'"/>
    <xsl:variable name="ButtonNameFill" select="'rgb(225,255,255)'"/>
    <xsl:variable name="ButtonNameClass" select="'big'"/>
    
    
 
    
</xsl:stylesheet>
