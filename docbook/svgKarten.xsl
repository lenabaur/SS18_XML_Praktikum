<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output
        method="xml"
        indent="yes"
        standalone="no"
        doctype-public="-//W3C//DTD SVG 1.1//EN"
        doctype-system="http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd"
        media-type="image/svg" />
    
    <xsl:include href="svgAbmessung.xsl"/>
    <xsl:template match="/">
        <svg xmlns="http://www.w3.org/2000/svg">
            <defs>
                
    <!-- Rahmen -->
        <rect  rx="{$RahmenRx}" ry="{$RahmenRy}" width="{$KartenBreite}" height="{$KartenHoehe}" fill="{$fill}" fill-opacity="{$frameFillOpacity}" 
           stroke="{$frameStroke}" stroke-width="{$frameStrokeWidth}"  />
                
   <!-- Karte Rückseite verdeckt -->        
                <a id="back">
                    <defs>
                        <linearGradient id="grad1" x1="0%" y1="0%" x2="0%" y2="100%">
                            <stop offset="0%" style="stop-color:rgb(224,255,255);stop-opacity:1" />
                            <stop offset="100%" style="stop-color:rgb(255,192,037);stop-opacity:1"/>
                        </linearGradient>
                    </defs>
                    <rect width="{$KartenBreite}" height="{$KartenHoehe}" fill="url(#grad1)" />
                </a>
   <!-- Alle Motive -->
                
                <!-- Ganz Blau -->
                <a id="allblue">
                    <rect   width="{$KartenBreite}" height="{$KartenHoehe}" fill="rgb(225,255,255)"  />
                    
                </a>
                <!-- Ganz Gelb -->
                <a id="allyellow">
                    <rect width="{$KartenBreite}" height="{$KartenHoehe}" fill="rgb(255,192,037)"  />
                    
                </a>
                
                <!-- Ball -->
                <a id="ball">
                    <circle cx="{$KartenBreite}-75" cy="{$KartenHoehe}-75" r="70" fill="rgb(255,192,037)"  stroke=" rgb(225,255,255)" />
                    <ellipse cx="{$KartenBreite}-65" cy="{$KartenHoehe}-110" rx="{$KartenBreite}-80" ry="{$KartenHoehe}-115" fill="rgb(225,255,255)" transform="rotate(30 20,40)"/>
                    <ellipse cx="{$KartenBreite}-65" cy="{$KartenHoehe}-110" rx="{$KartenBreite}-80" ry="{$KartenHoehe}-130" fill="rgb(255,192,037)" transform="rotate(30 20,40)"/>
                    
                </a>
                <!-- DAS WIRD SO WEITER GEMACHT MIT ALLEN MOTIVEN -->
 
 <!-- Buttons -->

                <!-- Button Blanc -->
                <circle id="button" cx="{$ButtonBlancCX}" cy="{$ButtonBlancCY}" r="{$ButtonR}" stroke="{$ButtonStroke}" 
                    stroke-width="{$frameStrokeWidth}" fill="{$ButtonFill}" 
                />
                
                <!-- Button Stats -->
                <a id="stats">
                        <use id="button" />                   
                    <style>
                        .big { font: bold 27px sans-serif;}
                    </style>
                    <text x="{$ButtonNamePosX}" y="{$ButtonNamePosY}" stroke="{$ButtonNameStroke}" 
                        fill="{$ButtonNameFill}" class="{$ButtonNameClass}">Stats
                    </text>
                 
                
                </a>
                <!-- Button Start -->
                <a id="start">
                    <use id="button" />
                    <style>
                        .big { font: bold 27px sans-serif;}
                    </style>
                    <text x="{$ButtonNamePosX}" y="{$ButtonNamePosY}" stroke="{$ButtonNameStroke}" 
                        fill="{$ButtonNameFill}" class="{$ButtonNameClass}">Start
                    </text>
                </a>
                <!-- Button Player -->
                <a id="player">
                    <use id="button" />
                    <polygon points="40,25 25,70 55,70" style="fill:rgb(225,255,255);stroke:black;stroke-width:3" />
                    <circle cx="40" cy="25" r="11" stroke="black" stroke-width="3" fill="rgb(225,255,255)" 
                    />
                </a>
                <!-- Button Exit -->
                <a id="exit">
                    <use id="button" />
                    <style>
                        .big { font: bold 27px sans-serif;}
                    </style>
                    <text x="{$ButtonNamePosX}" y="{$ButtonNamePosY}" stroke="{$ButtonNameStroke}" 
                        fill="{$ButtonNameFill}" class="{$ButtonNameClass}">Exit
                    </text>
                </a>

    
    
    
    
            </defs>
        </svg>
    </xsl:template>
</xsl:stylesheet>