#!/usr/bin/env bash

: 'A script for patching jar files. Useful when sending jar files
to another host and patch it to the rest of the project.
Either when developing on one system and running on another.
Or when you want to try another version of the code from a 
colleague without having to change the code and rebuild.'

if (( $# != 1 ))
then
    echo "ERROR: Wrong number of arguments. Insert one argument as the jar-file name."
else
    JAR_FILE_NAME="$1"
    cp "$JAR_FILE_NAME" temp.jar && chmod +rwx temp.jar
    # $? is used to check the status of last executed command. 
    # '0' => command was successfull
    # We could also have used $(<command>)
    if [[ $? -eq 0 ]]
    then
        #$() can be used to store value of a bash command into a variable.
        FOUND_JARS=$(find -mindepth 2 -name "$JAR_FILE_NAME" | wc -l)

        if [ $FOUND_JARS -eq 0 ]
        then
            echo "ERROR: File not found in this directory"
        elif [ $FOUND_JARS -gt 1 ]
        then
            echo "ERROR: Found more than 1 file with name $JAR_FILE_NAME in this directory"
        else
            echo "INFO: Found file"
            JAR_PATH=$(find -mindepth 2 -name "$JAR_FILE_NAME")
            mv -i temp.jar "$JAR_PATH" && echo "INFO: Patching successful"
        fi
    else
        echo "ERROR: No file named $JAR_FILE_NAME in current directory"
    fi
fi

if [[ -f temp.jar ]]
then
    rm temp.jar
fi