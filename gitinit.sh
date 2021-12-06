#!/bin/bash
## Usage: gitinit https://url.to.git/repo [/path/to/gitignore/template] ##
#  Sets up gitignore defaults

case $1 in
	--help|-h|"")
	cat << EOF
Usage: gitinit https://url.to.git/repo [/path/to/gitignore/template] 

Sets up gitignore defaults, adds a remote origin, and then creates and pushes an initial commit

EOF
	;;
	*)
	;;
esac

if [ -z "$1" ]; then 
	echo "No Remote specified!"
else

	if [ -z "$2" ]; then
		touch ".gitignore" # create empty gitignore
	else
		cp "$2" .gitignore
	fi

	git init

	#First arg should be origin URL
	git remote add origin $1

	git add .
	git commit -m "Initialize Repository"
	git branch -M main
	git push -u origin main

fi
