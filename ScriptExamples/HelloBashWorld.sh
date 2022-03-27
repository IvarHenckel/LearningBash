#!/usr/bin/env bash
# I don't see any file /usr/bin/bash but this still seems to work
echo "Hello world!"
if [[ $# -gt 0 && $1 == "list" ]] || [ 10 -eq 9 ]
then
    ls -l
else
    ls
fi

: '
Multiline comments in bash are weird....
'

cat << abborre

Hello, bojs! 
This is a heredoc!

abborre

number=10

if (( $number != 10 ))
then
    echo "the condition is true"
elif (( $number > 0)) && (( $number <= 9))
then
    echo "the second condition is true"
else
    echo "all conditions are false"
fi

loopnumber=1
while [ $loopnumber -lt 10 ]
do
    echo "$loopnumber"
    loopnumber=$((loopnumber + 1))
done


function funky()
{
    echo "Hello from funky function!"
}

funky

function funkyWithArgs()
{
    echo "Sent in $1 and $2"
}

funkyWithArgs "FirstArg" "SecondArg"