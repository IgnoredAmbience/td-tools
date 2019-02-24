# TD Analysis Scripts
A collection of shell and jq scripts to assist ad-hoc TD feed analysis.

All filters expect input data to be flattened to a stream of objects containing key-scalar pairs
only. i.e: Two layers of indirection removed.

Example usage:
```sh
cat td/2019/02/14/*/* | ./flatten.jq | ./filter-areas.jq --arg area Q0 | ./filter-desc.jq --arg desc 1T24 | ./display.jq
```

```sh
# Fetch today's logs
./fetch.sh
# Fetch given day's logs
./fetch.sh 20190101
```
