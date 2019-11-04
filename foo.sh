#!/bin/bash

# Choose a PDF opener depending on the OS
case "$(uname -s)" in
  Darwin)
    export evince_or_open="open"
    ;;
  Linux)
    export evince_or_open="evince"
    ;;
esac

make
#   grep "[A-Z]\." *.tex
$evince_or_open paper.pdf &
