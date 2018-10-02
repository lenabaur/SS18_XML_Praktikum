xquery version "3.0"  encoding "UTF-8";

declare function local:randomNumber($until as xs:integer) as xs:integer {
  xs:integer(ceiling(Q{java:java.lang.Math}random() * $until))
};