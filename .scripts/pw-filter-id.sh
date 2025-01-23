#!/usr/bin/env bash
# Get pipewire object id given its properties

[[ -z $1 ]] && exit 1
[[ -z $2 ]] && exit 1

pw-dump | jq ".[] | select(.info.props.\"$1\"==$2)" | jq '.id'
