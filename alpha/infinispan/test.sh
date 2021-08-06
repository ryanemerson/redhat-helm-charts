#!/bin/bash
reset
set -e

function retry {
	local n=1
	local max=5
	local delay=1
	while true; do
		$@ && break || {
		if [[ $n -lt $max ]]; then
			((n++))
			echo "Command failed. Attempt $n/$max:"
			sleep $delay;
		else
			fail "The command has failed after $n attempts."
		fi
		}
	done
}

retry "curl --insecure -L http://external-libs-web-server:8080/task02-1.0.0.zip -o file1.zip"
retry echo "Hello"

str="sha256:asfasf"
str="part1=part2=part3"
parts=("${(@s[:])str}")
echo ${#parts[@]}
