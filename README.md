# Solution to the Exercise 1.
 
The **find_files.sh** is a bash script that finds files with a certain suffix
below a specific location on the file system. It also allows filtering the search results using a regular expression.

**find_files.sh** accepts two or three arguments:

* arg1 - path to the directory where you want to find files,
* arg2 - file suffix (extension), e.g. doc, xls, txt, etc.
* arg3 - [optional] filter of the search results. It will discard the files that do not contain the specified expression.
* arg4 - [optional] unwanted pattern in the filenames. It will find files whose filenames contain the expression - experiment_2018, but do not contain the expression - mouse. 

## Example:
  
```
./find_files.sh ~/ doc *experiment_2018* *mouse*
```

To see the help run: `./find_files.sh -h`

### Contributor

[Natalia Chicherova](https://www.linkedin.com/in/natalia-chicherova-/)

2018
