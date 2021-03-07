###############################################################
##
## Name: curl.sh
## Description: Retrieve the name, clone_url, last commit date and last author of a given Github repo
## Usage: curl.sh ${orgname}/${repo}
## Version              Author          Remark
## -----------------------------------------
## 1.0                  Derence         Initial
#################################################################

#!/bin/bash

echo "Please provide the Github repo:"
read Input
orgname=`echo $Input | awk -F\/ {'print $1'}`
repo=`echo $Input | awk -F\/ {'print $2'}`

name=`curl -s  -H "Accept: application/vnd.github.v3+json"   https://api.github.com/repos/${orgname}/${repo} | grep -i name | head -1 | awk -F\: {'print $2'} | awk -F, {'print $1'} | sed 's/\"//g'`
clone_url=`curl -s  -H "Accept: application/vnd.github.v3+json"   https://api.github.com/repos/${orgname}/${repo} | grep -i clone_url | head -1 | awk -Fl\"\: {'print $2'} | awk -F, {'print $1'} | sed 's/\"//g' | sed 's/^ *//g'`
last_date=`curl -s  -H "Accept: application/vnd.github.v3+json"   https://api.github.com/repos/${orgname}/${repo}/commits | grep -i date | head -1 | awk  -F\: {'print $2'} | awk -F, {'print $1'} | sed 's/\"//g' | sed 's/^ *//g'`
last_author=`curl -s  -H "Accept: application/vnd.github.v3+json"   https://api.github.com/repos/${orgname}/${repo}/commits | grep -i name | head -1 | awk  -F\: {'print $2'} | awk -F, {'print $1'} | sed 's/\"//g' | sed 's/^ *//g'`

echo "Name,Clone_URL,Last Commit Date,Last Author"
echo ${name},${clone_url},${last_date},${last_author}
