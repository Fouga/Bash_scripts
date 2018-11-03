#!/bin/bash

# help to the bash script
if [ "$1" == "-h" ]; then
  echo " 
  Usage:  $0 ~/ doc *experiment_2018* *mouse*
  
  $0 - finds files with a certain suffix and filtering expression below a specific location on the file system where:
  
      -h  show this help text

      arg1  - is a path to the directory where you want to find files: ~/,
      arg2  - is files' suffix (extension): doc, xls, txt, etc.
      arg3  - [optional] is a filter of the search results: *experiment_2018*. 
              It will find files whose filenames contain the expression - experiment_2018. 
      arg4   - [optional] unwanted pattern in the filenames. 
               It will find files whose filenames contain the expression - experiment_2018 but do not contain - mouse."
  exit 0
fi

# check if 2 arguments are passed
if [[ ("$#" -gt 4) || ("$#" -lt 1) ]]; then 
	echo "Error. Only two,3 or 4 parameters should be specified: location, suffix, filter expression. See $0 -h for more info."
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
	# if two arguments, find files
	if [ "$#" -eq 2 ]; then 
		lines=$(find "$1" -name "*.$suf" -print | wc -l)
		#echo "$lines"
		if [ "$lines" -eq 0 ]; then
			echo "No files in $1 with the suffix $2 was found"
		elif [ "$lines" -gt 0 ]; then
			find "$1" -name "*.$suf" -print
		fi
	elif [ "$#" -eq 3 ]; then  

		# with filtering
		lines=$(find "$1" -name "$3.$suf" -print | wc -l)
		if [ "$lines" -eq 0 ]; then
			echo "No files in $1 containing expression $3 with the suffix $suf was found"
		elif [ "$lines" -gt 0 ]; then
			find "$1" -name "$3.$suf" -print
		fi
	elif [ "$#" -eq 4 ]; then 
		# with unwanted pattern
		lines=$(find "$1" -name "$3.$suf" ! -iname "$4" -print | wc -l)
		if [ "$lines" -eq 0 ]; then
			echo "No files in $1 containing expression $3 with the suffix $suf with excluded patterns $4 was found"
		elif [ "$lines" -gt 0 ]; then
			find "$1" -name "$3.$suf" ! -iname "$4" -print	
		fi
	fi
fi
