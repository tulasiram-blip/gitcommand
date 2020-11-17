#!/bin/bash

#taking input parameters branch and repository
branch=${1:-master}
repository=${2:-source}
echo "branch $branch & repository $repository"

#giving username and password to create repo in server
read username
echo "${username}"

read -s password
echo "${password}"

#creating new directory
mkdir task
echo "new directory is created"

#changing to new folder
cd task
echo "changed to folder task"

#initializing repo
git init
echo "initialized empty repository"

#creatinfg 2 new files
touch file file1
echo "files file & file1 are created in working area"

#move files from working area to staging area
git add file file1
echo "files moved to staging area and ready to be commited"

#commit changes
git commit -m "commit changes"
echo "changes are commited in local repo"

#creating remote repo
git remote add origin git@github.com:$username/$repository.git
curl -u $username:$password https://api.github.com/user/repos -d "{\"name\": \"$repository\"}"
echo "new repository created in server"

#eval $(ssh-agent -s)
#ssh-keygen -t rsa -b 4096 -c "potutulasiram@gmail.com"
#ssh-add ~/.ssh/id_rsa
#cat ~/.ssh/id_rsa.pub
#curl -u $username:$password https://api.github.com/user/keys -d '{"title":"my_laptop", "key":"git cli"}'
