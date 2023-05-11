<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <meta http-equiv="Content-Style-Type" content="text/css">
  <title></title>
  <meta name="Generator" content="Cocoa HTML Writer">
  <meta name="CocoaVersion" content="2299.5">
  <style type="text/css">
    p.p1 {margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px Menlo; color: #5f70a8; -webkit-text-stroke: #5f70a8}
    p.p2 {margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px Menlo; color: #d7d7db; -webkit-text-stroke: #d7d7db; min-height: 14.0px}
    p.p3 {margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px Menlo; color: #c8f199; -webkit-text-stroke: #c8f199}
    p.p4 {margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px Menlo; color: #d7d7db; -webkit-text-stroke: #d7d7db}
    p.p5 {margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px Menlo; color: #e5a8ff; -webkit-text-stroke: #e5a8ff}
    p.p6 {margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px Menlo; color: #aed0ff; -webkit-text-stroke: #aed0ff}
    span.s1 {font-kerning: none; background-color: #1f1f31}
    span.s2 {font-kerning: none}
    span.s3 {font-kerning: none; color: #d7d7db; background-color: #1f1f31; -webkit-text-stroke: 0px #d7d7db}
    span.s4 {font-kerning: none; color: #e5a8ff; background-color: #1f1f31; -webkit-text-stroke: 0px #e5a8ff}
    span.s5 {font-kerning: none; color: #8bffff; background-color: #1f1f31; -webkit-text-stroke: 0px #8bffff}
    span.s6 {font-kerning: none; color: #fd8893; background-color: #1f1f31; -webkit-text-stroke: 0px #fd8893}
    span.s7 {font-kerning: none; color: #aed0ff; background-color: #1f1f31; -webkit-text-stroke: 0px #aed0ff}
    span.s8 {font-kerning: none; color: #c8f199; background-color: #1f1f31; -webkit-text-stroke: 0px #c8f199}
  </style>
</head>
<body>
<p class="p1"><span class="s1">#! /bin/bash</span></p>
<p class="p2"><span class="s2"></span><br></p>
<p class="p3"><span class="s3">PSQL=</span><span class="s1">"psql --username=freecodecamp --dbname=periodic_table -t --tuples-only -c"</span></p>
<p class="p2"><span class="s2"></span><br></p>
<p class="p4"><span class="s4">if</span><span class="s1"> [[ </span><span class="s5">-z</span><span class="s1"> </span><span class="s6">$1</span><span class="s1"> ]]</span></p>
<p class="p5"><span class="s1">then</span></p>
<p class="p3"><span class="s3"><span class="Apple-converted-space">  </span></span><span class="s7">echo</span><span class="s3"> -e </span><span class="s1">"Please provide an element as an argument."</span></p>
<p class="p6"><span class="s3"><span class="Apple-converted-space">  </span></span><span class="s1">exit</span></p>
<p class="p5"><span class="s1">fi</span></p>
<p class="p2"><span class="s2"></span><br></p>
<p class="p1"><span class="s1">#if argument is atomic number</span></p>
<p class="p4"><span class="s4">if</span><span class="s1"> [[ </span><span class="s6">$1</span><span class="s1"> </span><span class="s5">=~</span><span class="s1"> ^[1-9]+$ ]]</span></p>
<p class="p5"><span class="s1">then</span></p>
<p class="p3"><span class="s3"><span class="Apple-converted-space">  </span>element=</span><span class="s1">$(</span><span class="s6">$PSQL</span><span class="s1"> "select atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius from elements join properties using(atomic_number) join types using(type_id) where atomic_number = '</span><span class="s6">$1</span><span class="s1">'")</span></p>
<p class="p5"><span class="s1">else</span></p>
<p class="p1"><span class="s1">#if argument is string</span></p>
<p class="p3"><span class="s3"><span class="Apple-converted-space">  </span>element=</span><span class="s1">$(</span><span class="s6">$PSQL</span><span class="s1"> "select atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius from elements join properties using(atomic_number) join types using(type_id) where name = '</span><span class="s6">$1</span><span class="s1">' or symbol = '</span><span class="s6">$1</span><span class="s1">'")</span></p>
<p class="p5"><span class="s1">fi</span></p>
<p class="p2"><span class="s2"></span><br></p>
<p class="p1"><span class="s1">#element not in db</span></p>
<p class="p4"><span class="s4">if</span><span class="s1"> [[ </span><span class="s5">-z</span><span class="s1"> </span><span class="s6">$element</span><span class="s1"> ]]</span></p>
<p class="p5"><span class="s1">then</span></p>
<p class="p3"><span class="s3"><span class="Apple-converted-space">  </span></span><span class="s7">echo</span><span class="s3"> -e </span><span class="s1">"I could not find that element in the database."</span></p>
<p class="p6"><span class="s3"><span class="Apple-converted-space">  </span></span><span class="s1">exit</span></p>
<p class="p5"><span class="s1">fi</span></p>
<p class="p2"><span class="s2"></span><br></p>
<p class="p4"><span class="s7">echo</span><span class="s1"> </span><span class="s6">$element</span><span class="s1"> </span><span class="s5">|</span><span class="s1"> </span><span class="s4">while</span><span class="s1"> IFS=</span><span class="s8">" |"</span><span class="s1"> </span><span class="s7">read</span><span class="s1"> an name symbol </span><span class="s7">type</span><span class="s1"> mass mp bp<span class="Apple-converted-space"> </span></span></p>
<p class="p5"><span class="s1">do</span></p>
<p class="p3"><span class="s3"><span class="Apple-converted-space">  </span></span><span class="s7">echo</span><span class="s3"> -e </span><span class="s1">"The element with atomic number </span><span class="s6">$an</span><span class="s1"> is </span><span class="s6">$name</span><span class="s1"> (</span><span class="s6">$symbol</span><span class="s1">). It's a </span><span class="s6">$type</span><span class="s1">, with a mass of </span><span class="s6">$mass</span><span class="s1"> amu. </span><span class="s6">$name</span><span class="s1"> has a melting point of </span><span class="s6">$mp</span><span class="s1"> celsius and a boiling point of </span><span class="s6">$bp</span><span class="s1"> celsius."</span></p>
<p class="p5"><span class="s1">done</span></p>
<p class="p2"><span class="s2"></span><br></p>
<p class="p1"><span class="s1">## Custom</span></p>
<p class="p1"><span class="s1">## Periodic Table Element script</span></p>
<p class="p1"><span class="s1">## Attempt 5000</span></p>
</body>
</html>
