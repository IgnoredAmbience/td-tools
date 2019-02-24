#!/usr/bin/env -S jq -f
# Example usage: ./filter-type --arg type "^C"
select(.msg_type | test($type, "i"))
