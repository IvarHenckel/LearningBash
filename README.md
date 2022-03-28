# LearningBash
A repo for collecting notes and example bash scripts on my way to learn bash scripting in more detail.

Iv'e used a lot of sources but mostly this one: https://www.youtube.com/watch?v=e7BufAVwDiM


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

A comment on the difference between sh and bash. "Please do not be fooled by scripts or examples on the Internet that use /bin/sh as the interpreter. sh is not bash! Bash itself is a "sh-compatible" shell (meaning that it can run most 'sh' scripts and carries much of the same syntax) however, the opposite is not true; some features of Bash will break or cause unexpected behavior in sh."

To run a script use ->
    
    <script name>.sh

When running with ./&lt;script name&gt;.sh we obviously need the correct access rights (check with ls -l). If we don't have execution rights we need to add this with->

    chmod +x <script name>.sh

Or we can use the following. In which case we don't need "#!". (This is unusual and just means there's one extra thing to consider when running the script. I.e. which shell to run the script.)->

    bash <script name>.sh

## Bash Script Syntax
Bash treats ";" as a newline so you can either use ";" or a newline where needed. If you want to split up one command into several rows you have to use "\" = EOL;

Bash doesn't have a strong type system. So you can't restrict variables to be a numeric variable or a string specifically.

We can obiously use normal unix commands like ls, mkdir or whatever inside the script (I mean, that's basically the purpose).

To create a variable, type a name with only capital letters followed by an equal sign and the variable value.->

    MYVARIABLE="Just a variable"

We reference the variable with a dollar sign->

    echo $MY_VARIABLE

Command line arguments will automatically be assigned the variable names 1, 2, 3 and so on. So we can reference by->

    echo "Printing the first argument: $1";

Note: $0 is the script name or the shell name if we use it directly in the terminal. You can run echo $0 to get the default shell name.

Note: If we have lot's of script parameters you might want to use the following to store all parameters in an array. The number of inparameters is given by $#.->
    
    args=("S@")

You reference an element of an array with->

    ${args[<index>]}

A loop and a comment in bash->

    loopnumber=1
    while [ $loopnumber -lt 10 ]
    do
        # Do something
        loopnumber=$((loopnumber + 1))
    done

Note: 'until' is like while but it runs until the condition is true (i.e. while false)

A for loop looks like this->

    for i in 1 2 3 4 5
    do
        # Do something
    done

or
    # The last ..2 means we increment by 2 each iteration. It's optional.
    for i in {0..20..2}
    do
        # Do something
    done
or
    for (( i=0; i<5; i++ ))
    do
        # Do something
    done

Note: Break and continue can be used just like in Java/C.

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
        : '
        Do something else.
        This is a multi line comment.
        Kinda weird.....
        '
    fi

Note: one guy says that usually you don't want nested if statements and 
using && when posible is better.
Second note: The spaces inside [ ] is needed! We get an error otherwise.

Different logical operators are:

    -eq
    -lt
    -le
    -gt
    -ge
    -ne
    -a (and)
    -o (or)
    -z (isEmpty) (I'm sure there is a nonEmpty as well?)
    -d (checks if directory exists, I think?)
    -f (checks if file exists, I think?)

If we replace [ ] with (( )) we can use the normal <,>, ==, != operators.

Run two independent commands in parallel->

    <some_command> & <antother_command> 

Run two commands but only execute the commando to the right if the first one was successfull->

    <some_command> && <antother_command> 

Redirect stdoutput to file ->

    <some_command> > <some_file>

We can be more specific and redirect stdoutput (1) to one file and stderror to another:

    <some_command> 1><some_file> 2><another_file>

Redirect output to file but append instead of replace file content ->
    
    <some_command> >> <some_file>

redirect input from file
    
    <some_command> < <some_file>

Note: This can be used on blocks of statements as well. As an example->

    while read line
    do
        # Do something with line
    done < <input_file_name>

When writing shell scripts you may be in a situation where you need to pass multiline block of text or code to an interactive command. Then we can use something called an heredoc. The heredoc name can be anything.

    cat << <heredoc_name>
    Any text.....
    <heredoc_name>

"<< is known as here-document structure. You let the program know what will be the ending text, and whenever that delimiter is seen, the program will read all the stuff you've given to the program as input and perform a task upon it"

With pipes we make the stdoutput from the first command the stdinput for the second command->

    <some_command> | <another_command>

If we want to send output from one script as an input to another script you can use export->

    MESSAGE="HEJ HOPP"
    export MESSAGE
    ./<name_of_other_script>.sh

    # In the other script we can then write
    echo "This is the message from the first script: $MESSAGE"

Concatinating two varible (String) values is really simple.->

    concatinated=$s1$s2

Lowercase and uppercase is also simple->

    echo "lower case print ${st1^}"
    echo "upper case print ${st1^^}"

If we just use "echo 31+32" it will print "31+32". Instead use ->

    echo $((31 + 32))
    # Or..
    echo $(expr 31 + 31)

With the declare command you can declare varibles global to bash (i.e. all terminals/scripts can use the variable).->

    declare myvar=22
    echo $myvar 
    # Second line can be executed in any script

Arrays in Bash can be created with->

    car_array=('BMW' 'TOYOTA' 'HONDA')

    echo "${car[0]}" # Prints BMW
    echo "${car[@]}" # Prints the whole array
    echo "${#car[@]}" # Prints the size of the array

    unset car[1] # This will remove TOYOTA from the array.

Functions in bash->

    function <function name>() {
        # Do something use the argument with $1 just like command line args.
    }

    <function name> <some_arg># Call the function
    # Note. No () used. And we need to declare before call.

Note: It seems that all variables have global scope. So if I set a variable in a function that value is changed globally, it is not just a local variable with the same name.

One guy says that if you use a lot of functions that's a good sign you should be using Python/Perl instead.

## Useful Bash Commands to Remember (I didn't already know them)
As an alternative instead of a .sh file that we can execute we can use alias->

    alias <aliasname>=<some bash commands, i.e. a bashscript>;

Curl downloads a file from the internet. I've used curl before but he might have some new info.->
    
    curl <some url> > <new file name>
    # -O instead of > while just give it the original filename
    # -o <new_file_name> can be used instead of > with the same behaviour.
    # curl -I <some_url> will present info on the file. Can be good to use before downloading.

### When to you need to put double quotes on variables?

"General rule: quote it if it can either be empty or contain spaces (or any whitespace really) or special characters (wildcards). Not quoting strings with spaces often leads to the shell breaking apart a single argument into many."

I interpret this as: You should always use "" if you're working with strings. You don't need to if you're working with numerical values. If you're unsure, just put a "" there, it doesn't hurt.

## Debugging Bash 
You can run with debug using->

    bash -x ./helloScript.sh

You can achieve the same thing by putting -x after the shebang->

    #!/usr/bin/env bash -x

A third way to debug is to use the following inside the script.->

    set -x # When you want debugging to start in the script

    # Some code you want to debug...

    set +x # When you want debugging to stop in the script 

## TODO:
- To get some pactical experience write a script to patch jar files.
- Any other ideas on practical experience?