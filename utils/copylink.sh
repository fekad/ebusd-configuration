#!/bin/bash
# helper for copying symlinks in `$2` with base dir `$1` into `$3` and following
link=$(grealpath -s --relative-to="$1" "$2")
target=$(grealpath --relative-to="$1" "$2")
link=$(echo "$link"|sed -e 's#\.tsp#.csv#')
target=$(echo "$target"|sed -e 's#\.tsp#.csv#')
shift 2
while [[ -n "$1" ]]; do
  (
    dir=$(gdirname $target)
    cd "$1"
    rel=$(grealpath --relative-to="$dir" "$target")
    ln -s "$rel" "$link"
  )
  shift
done
