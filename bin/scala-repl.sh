#!/bin/bash
test -e ~/.coursier/cr || (mkdir -p ~/.coursier && wget -q -O ~/.coursier/cr https://git.io/vgvpD && chmod +x ~/.coursier/cr)
CLASSPATH="$(~/.coursier/cr fetch -q -p \
  \
  com.chuusai:shapeless_2.11:2.3.0 \
  com.lihaoyi:ammonite-repl_2.11.7:0.5.2 \
  org.typelevel:cats_2.11:0.5.0 \
  \
)" java ammonite.repl.Main --predef 'import shapeless._'
