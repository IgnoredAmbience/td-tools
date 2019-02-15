# TD Analysis Scripts
A collection of shell and jq scripts to assist ad-hoc TD feed analysis.

Example usage:
```sh
cat td/2019/02/14/*/* | ./filter-areas.jq --arg area Q0 | ./filter-desc.jq --arg desc 1T24 | ./display.jq -Cc
```

```sh
# Fetch today's logs
./fetch.sh
# Fetch given day's logs
./fetch.sh 20190101
```
