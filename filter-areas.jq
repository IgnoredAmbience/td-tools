#!/usr/bin/env -S jq -f
# usage: filter-desc.jq --arg desc 1T24
select(.area_id == $area)
