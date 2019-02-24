#!/usr/bin/env -S jq -f
# usage: ./flatten.jq
.[] | .[]
