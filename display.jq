#!/usr/bin/env -S jq -sf
# Sort records in time order, and convert datestamps to iso, flatten records
[.[] | .[]] | sort_by(.[]|.time) | .[] | .[] | .time = (.time|tonumber/1000|todate)
