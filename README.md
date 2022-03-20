# LearningBash
A repo for collecting notes and example bash scripts on my way to learn bash scripting in more detail.

Iv'e used a lot of sources but currently following this one: https://www.youtube.com/watch?v=e7BufAVwDiM

7 m 42 s in to the video

## Initial Notes about Bash
Bash = A CLI / Shell to interact with a computer from the command line.

BASH = The Bourne-Again Shell

Bash is the default shell in most unix systems.

I am already very familiar with using Bash as a CLI shell but you can also use it as a simple scripting language (referred to by some as Bash Programming) which this repo is mostly about.

## Bash Script Execution
Use .sh as file ending (no extension works, but that's obviously less informative).

First line in a bash script should always be a #! (pronounced "shebang") followed by the path to the application that should run the script. ->
#!/usr/bin/bash

This didn't work for me due to a different path. Using the following is a workaround to run the first bash found on the PATH. And it seems to be preffered for portability.->
#!/usr/bin/env bash

A comment on the difference between sh and bash. "Please do not be fooled by scripts or examples on the Internet that use /bin/sh as the interpreter. sh is not bash! Bash itself is a "sh-compatible" shell (meaning that it can run most 'sh' scripts and carries much of the same syntax) however, the opposite is not true; some features of Bash will break or cause unexpected behavior in sh." I think he's saying that sh is the language and bash is the interpreter?

To run a script use ->
./&lt;script name&gt;.sh

When running with ./&lt;script name&gt;.sh we obviously need the correct access rights (check with ls -l). If we don't have execution rights we need to add this with->
chmod +x &lt;script name&gt;.sh

Or we can use the following. In which case we don't need "#!". (This is unusual and just means there's one extra thing to consider when running the script. I.e. which shell to run the script.)->
bash &lt;script name&gt;.sh

## Bash Script Syntax
We can obiously use normal unix commands like ls, mkdir or whatever inside the script (I mean, that's basically the purpose).

To create a variable, type a name with only capital letters followed by an equal sign and the variable value.->
MYVARIABLE="Just a variable"

We reference the variable with a dollar sign->
echo $MY_VARIABLE

Command line arguments will automatically be assigned the variable names 1, 2, 3 and so on. So we can reference by->
echo "Printing the first argument: $1";
Note: $0 is the shell name. You can run echo $0 to get the default shell name.

A loop and a comment in bash->
while true; do
    # Do something
done

If we need user input in the middle of a script we can use something like this ->
while true; do
    read -p "Learn about bash scripts?" yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no";;
    esac
done

if statements in bash->
if [ $2 -lt 21 ] ; then
    # Do something
else
    # Do something else
fi
Note: one guy says that usually you don't want nested if statements and 
using && when posible is better.

Bash treats ";" as a newline so you can either use ";" or a newline where needed. If you want to split up one command into several rows you have to use "\" = EOL;

## Summary of useful bash commands
### Basic Stuff That I Already Knew
Create a file->
touch &lt;filename&gt;

Print out->
echo "&lt;some string&gt;"

Run two independent commands in parallel->
&lt; some_command &gt; & &lt; antother_command &gt; 

Run two commands but only execute the commando to the right if the first one was successfull->
&lt; some_command &gt; && &lt; antother_command &gt; 

Clear the terminal window->
clear

Redirect output to file ->
&lt; some_command &gt; &gt; &lt; some_file &gt;

redirect input from file
&lt; some_command &gt; &lt; &lt; some_file &gt;
### New Stuff
As an alternative instead of a .sh file that we can execute we can use alias->
alias &lt;aliasname&gt;=&lt;some bash commands, i.e. a bashscript&gt;

## TODO:
- Divide this file into several md files in the Docs folder if it get's to long.
- Don't forget to checkout how this md file renders before pushing. (Use Ctrl+Shift+V to see the preview)