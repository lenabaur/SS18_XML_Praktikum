xquery version "3.0";

declare %updating function local:updateContent ($e as xs:string, $p as xs:string)
{
  replace value of node fn:doc("game.xml")/data($e)
with data($p)
 
};

local:updateContent(memory/spieler[@num=2]/name, "Lena")

