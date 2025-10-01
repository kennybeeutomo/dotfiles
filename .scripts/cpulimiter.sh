#!/usr/bin/env bash
# script to change cpu max performance in percent as in /sys/devices/system/cpu/intel_pstate/max_perf_pct

# shellcheck disable=SC1090
source ~/.scripts/utils

currPerf=$(cat /sys/devices/system/cpu/intel_pstate/max_perf_pct)
perfs=$(echo {1..10}0)

perf=$(echo "$perfs" | vmenu -select "$currPerf" -sep ' ' -p 'CPU Max Performance (%)')

[ -z "$perf" ] && exit 1

echo "$perf" | pkexec tee /sys/devices/system/cpu/intel_pstate/max_perf_pct
