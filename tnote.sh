#!/bin/sh
# tnote - take note - a simple note-taking script
# ISO8601 format as standard for date and name (precise to the second)

while getopts "f:n:d:t:e:" i; do
	case $i in
		f) ext=$OPTARG ;;	# Extension/format of file, e.g. txt or md
		n) name=$OPTARG ;;	# Name of file
		d) dir=$OPTARG ;;	# Directory
		t) time=$OPTARG ;;	# Time
		e) EDITOR=$OPTARG ;;	# Preffered editor
	esac
done

[ -z $dir ] && read -ep "Please enter note directory: " dir # You can leave this blank
[ -z $time ] && time=`date -Is`
[ -z $name ] && name=$time
[ -z $ext ] && read -ep "Please enter format/extension: " ext # You can leave this blank
[ ! $ext == "" ] && name="$name.$ext"
[ ! $dir == "" ] && dir="$dir/"

$EDITOR "$dir$name"
