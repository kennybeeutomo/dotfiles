# test cases

exe=main

inputs=(
)
i=1

for input in "${inputs[@]}"; do
	echo "=== input $i ==="
	echo "$input"
	echo "=== output $i ==="
	"./$exe" <<< "$input"
	echo

	i=$(( i + 1 ))
done
