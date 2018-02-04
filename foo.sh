#!/bin/bash
source $(dirname $0)/os.sh

make
$evince_or_open paper.pdf &
