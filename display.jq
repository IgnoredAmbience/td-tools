#!/usr/bin/env -S jq -sfc

# Convert the input integer to a string in the specified base (2 to 36 inclusive)
def convert(base):
  def stream:
    recurse(if . > 0 then ./base|floor else empty end) | . % base ;
  if . == 0 then "0"
  else  [stream] | reverse | .[1:]
  | if   base <  10 then map(tostring) | join("")
    elif base <= 36 then map(if . < 10 then 48 + . else . + 87 end) | implode
    else error("base too large")
    end
  end;

# input string is converted from "base" to an integer, within limits
# of the underlying arithmetic operations, and without error-checking:
def to_i(base):
  explode
  | reverse
  | map(if . >= 97  then . - 87 elif . >= 65 then . - 55 else . - 48 end)  # A / a / 0
  | reduce .[] as $c
      # state: [power, ans]
      ([1,0]; (.[0] * base) as $b | [$b, .[1] + (.[0] * $c)])
  | .[1];

def lpad(char; len):
  char * (len - (.|length)) + .;

# Sort records in time order, and convert datestamps to iso, flatten records
sort_by(.time) | .[]
  | .time |= (.|tonumber/1000|todate)
  | if .address | type == "string" then .address |= (. | to_i(16)) else . end
  | if .data | type == "string" then .data |= (. | to_i(16) | convert(2) | lpad("0"; 8)) else . end

