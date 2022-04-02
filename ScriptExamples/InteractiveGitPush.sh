#! /usr/bin/env bash

echo "Welcome! This script adds, commits and pushes modified files interactively."

echo "We begin by showing the output from: git status"
git status

echo "Now let's choose which files to add:"
ANY_ADD=0
for FILE in "$(git status | grep "modified")"
do
    # Remove everything up to and including ":" and xargs removes spaces
    FILE=${FILE#*:} | xargs
    while true; do
        read -p "Add file ? (yes, no, quit): " answer
        if [ "$answer" == "quit" ]; then
            exit 0
        elif [ "$answer" == "yes" ]; then
            git add "$FILE"
            ANY_ADD=1
            break
        elif [ "$answer" == "no" ]; then
            break    
        else
            echo "Please write \"quit\", \"yes\" or \"no\""
        fi
    done
done

if [ $ANY_ADD -eq 1 ]; then 
    read -p "About to commit and push. Insert message: " COM_MSG
    git commit -m "$COM_MSG" && git push
fi


# FILES=("senap")
# git status | grep "modified" | while read line
# do
#     # echo $line
#     # echo "johnyys ${FILES[@]}"
#     # FILES+=("${line#*: }")
#     FILES+=("gurka")
#     echo "${FILES[@]} hej"
# done

# echo "${FILES[@]} hej"

# for FILE in "${FILES[@]}"
# do
#     echo "$FILE"
# done

# echo "Add ${line#*: } ?"
# while true
# do
# read addAnswer
# #if [ "$addAnswer" -eq "quit" ]
# #then
# #    exit
# #else
#     echo "Please write \"quit\", \"yes\" or \"no\""
# #fi
# done