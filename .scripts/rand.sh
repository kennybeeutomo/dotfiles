#!/usr/bin/env bash
# Script to generate random numbers

usage() {
	echo 'rand.sh [START | -f START] [END | -t END] [COUNT | -k COUNT] [-cn]'
	echo 'Generates random numbers in range [START, END) COUNT times'
	echo "Running it with no arguments is the equivalent of \`echo \$RANDOM\`"
	echo
	echo 'Options:'
	echo '  -c    append commas to each number'
	echo '  -n    print all numbers in one line'
	echo '  -h    help'
	echo
	echo 'Examples:'
	echo '  generate a random number:'
	echo
	echo '    rand.sh'
	echo
	echo '  generate 20 random numbers between 1 and 99:'
	echo
	echo '    rand.sh 1 100 20'
	echo
	echo '  generate 10 random numbers between 100 and 999:'
	echo
	echo '    rand.sh -f 100 -t 1000 -k 10'
	echo
	echo '  generate 50 random numbers between 10 and 99 in one line separated by commas:'
	echo
	echo '    rand.sh 10 100 50 -cn'
}

opts=$(getopt -o cnhf:t:k: -- "$@")
eval set -- "$opts"

while [ -n "$1" ]; do
	case $1 in
		-h ) shift; usage; exit 0 ;;
		-f ) shift; min=$1; shift ;;
		-t ) shift; max=$1; shift ;;
		-k ) shift; count=$1; shift ;;
		-c ) shift; commas=true ;;
		-n ) shift; oneline=true ;;
		-- )
			shift
			min=${1:-$min}
			max=${2:-$max}
			count=${3:-$count}
			break
			;;
		* ) exit 1 ;;
	esac
done

min=${min:-0}
max=${max:-100000}

count=${count:-1}
count=$(eval "echo {1..$count}")

commas=${commas:-false}
oneline=${oneline:-false}

for _ in $count; do
	echo -n $(( min + RANDOM % (max - min) ))
	if $commas; then echo -n ','; fi
	if $oneline; then echo -n ' '; else echo; fi
done

if $oneline; then echo; fi
