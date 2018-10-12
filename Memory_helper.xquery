xquery version "3.0";

module namespace helper = "http://basex.org/memory/helper";

declare function helper:timestamp() as xs:string {
  (: returns a timestamp in the form hhmmssmmmxxxx (hours, minutes, seconds, milliseconds, random number) :)
  (: removes ":" and "." separators and time zone info from current-time(), then appends a random number :)
  let $time := replace(replace(replace(string(current-time()),":",""),"\.",""),"[\+\-].*","")
  let $random := xs:string(helper:random(50000) - 1)
  return concat("Memory_", $time,$random)
};

declare function helper:time() as xs:string {
  let $time := substring(string(current-time()),1,5)
  return $time
};

declare function helper:date() as xs:string {
  let $date := substring(string(current-date()),1,10)
  return $date
};


declare function helper:random($range as xs:integer) as xs:integer {
  (: returns a random number in [1,$range] :)
  (: uses Java function until generate-random-number is generally available :)
  xs:integer(ceiling(Q{java:java.lang.Math}random() * $range))
};
