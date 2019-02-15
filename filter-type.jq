#!/usr/bin/env -S jq -f
[.[] | select(.[].msg_type | startswith($type))]
