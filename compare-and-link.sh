#!/bin/sh
if [ $# -ne 2 ]; then
    echo "Error: This script requires exactly two arguments. Usage: ./compare-and-link.sh <path_to_first_dir> <path_to_second_dir>"
    echo "Second dir links against first dir"
    exit 1
fi

if ! test -d "$1"; then
    echo "Error: The first argument is not a valid directory"
    exit 2
fi

if ! test -d "$2"; then
    echo "Error: The second argument is not a valid directory"
    exit 3
fi
set -- "$(readlink -f "$1")" "$(readlink -f "$2")"
echo "arguments are $@"

getrelpath() {
  ownpath="$(pwd)"
  remotepath="$(dirname $1)"
  filename=$(basename $1)
  elements=$(($(echo $remotepath | wc -c) - $(echo $remotepath | sed "s|/||g" | wc -c)))
  common=0
  for i in $(seq 2 $((elements+1)) ); do
    fragment_remote="$(echo $remotepath | cut -d '/' -f $i)"
    fragment_own="$(echo $ownpath | cut -d '/' -f $i)"
    if [[ "$fragment_remote" != "$fragment_own" ]]; then
      common=$((i-1))
      break
    fi
  done
  #echo "        getrelpath: remotepath is $remotepath"
  #echo "        getrelpath: $ownpath compared to $remotepath has $((common - 1)) common elements out of $elements"
  #echo "        getrelpath: resulting common path is $(echo $remotepath | cut -d '/' -f -$common)"
  #echo "        getrelpath: resulting uncommon path is $(echo $remotepath | cut -d '/' -f $((common + 1))-)"
  relpath="$(printf -v spaces '%*s' $((elements + 1 - common)) ''; printf '%s\n' ${spaces// /../})$(echo $remotepath | cut -d '/' -f $((common + 1))-)/$filename"
  #echo "        getrelpath: result is $(ls $relpath 2>&1)"
  echo "$relpath"
}

pushd "$2"
echo "relpath is $relpath"
pnrelbase "$1" "$2"
for file in $(find . -type f | cut -d "/" -f 2-); do
  filedir=$(dirname $file)
  filename=$(basename $file)
  pushd $filedir > /dev/null
  echo "found file, comparing $filename and $1/$file"
  test -f "$1/$file" && git diff --no-index "$1/$file" "$filename" #--quiet
  exit=$?
  if [[ $exit -eq 0 ]]; then #there is no difference, safe to link
      link_remote_file=$(getrelpath "$1/$file")
      echo "    no difference, linking with relative path; ln -s -f $link_remote_file $filename"
      # sanity check
      if test -f $link_remote_file; then
        # ask confirmation to link
        read -p "    do you want to 'ln -s -f $link_remote_file $filename' ?" -n 1 -r
        echo    # (optional) move to a new line
        if [[ $REPLY =~ ^[Yy]$ ]]; then
          ln -s -f $link_remote_file $filename
        fi
      fi
  else
      echo "    different, keeping own"
  fi
  popd > /dev/null
done;
popd


