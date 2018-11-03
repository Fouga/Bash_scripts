#!/bin/bash

# help to the bash script
if [ "$1" == "-h" ]; then
  echo " 
  Usage:  $0 ~/ doc *experiment_2018*
  
  $0 - finds files with a certain suffix and filtering expression below a specific location on the file system where:
  
      -h  show this help text

      arg1  - is a path to the directory where you want to find files: ~/,
      arg2  - is files' suffix (extension): doc, xls, txt, etc.
      arg3  - [optional] is a filter of the search results: *experiment_2018*. 
              It will find files whose filenames contain the expression - experiment_2018 "
  exit 0
fi

# check if 2 arguments are passed
if [[ ("$#" -gt 3) || ("$#" -lt 1) ]]; then 
	echo "Error. Only two or three parameters should be specified: location, suffix, filter expression. See $0 -h for more info."
# check if directory (location) exists
elif [ ! -d "$1" ]; then
	echo "Directory $1 does not exist"
else


	# check if a point is a part of the suffix
	if [[ "$2" == *"."* ]];then
		suf="${2//.}"
	else
		suf="$2"
	fi
	#echo "$suf"
	if [ "$#" -eq 2 ]; then 
		lines=$(find "$1" -name "*.$suf" -print | wc -l)
		#echo "$lines"
		if [ "$lines" -eq 0 ]; then
			echo "No files in $1 with the suffix $2 was found"
		elif [ "$lines" -gt 0 ]; then
			find "$1" -name "*.$suf" -print
		fi
	else
		# with filtering
		lines=$(find "$1" -name "$3.$suf" -print | wc -l)
		#echo "$3"
		if [ "$lines" -eq 0 ]; then
			echo "No files in $1 containing expression $3 with the suffix $2 was found"
		elif [ "$lines" -gt 0 ]; then
			find "$1" -name "$3.$suf" -print
		fi
	fi
fi
