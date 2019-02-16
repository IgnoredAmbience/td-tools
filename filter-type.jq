#!/usr/bin/env -S jq -f
[.[] | select(.[].msg_type | test($type, "i"))]
