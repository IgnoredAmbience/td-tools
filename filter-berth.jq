#!/usr/bin/env -S jq -f
# Example usage: ./filter-berth.jq --arg berth 530
first(select((.from | values | test($berth, "i")) or (.to | values | test($berth, "i"))))
