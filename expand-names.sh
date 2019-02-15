#!/bin/bash
# Rename all directories to lexically sort
for d in $(find td -maxdepth 2 -name '?' -type d); do mv $d $(dirname $d)/0$(basename $d); done
for d in $(find td -maxdepth 3 -name '?' -type d); do mv $d $(dirname $d)/0$(basename $d); done
for d in $(find td -maxdepth 4 -name '?' -type d); do mv $d $(dirname $d)/0$(basename $d); done
for f in $(find td -name '?.td'); do mv $f $(dirname $f)/0$(basename $f); done
