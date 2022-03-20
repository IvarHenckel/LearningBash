# What alternatives tools are there?

In this text I try to understand whether there are other tools better suited for scripting than bash. Bash is definietly well known and widely used. But is Bash the best scripting tool to learn as a developer in 2022?

In the current market I would assume Bash is the most used and sought after skill in terms of scripting. But how about in the future?

A big plus with bash to begin with is that I know that the company that I will work in now uses bash. When it comes to previous experience with other companies some have used bash, some have used python and some have used perl.

# A really good comment on quora which basically sums everything below up
"If you’re a professional programmer, you quickly learn that there’s no one language that’s good for everything. You end up needing 3 major classes of languages:
1. A compiled language suitable for large-scale coding. C, Java, plenty of other suitable languages.
2. A language suitable for smaller tasks, usually interpreted. Historically has been Perl, now Python is the big thing in this range
3. An operating system scripting language. Windows has Powershell, the Unix/Linux world has bash. Yes, there are a few other shells - IBM is hung up on ksh for AIX for reasons I fail to fathom, there’s zsh and I’m sure some masochists are still trying to use csh-derived shells for scripting 

Bottom line? If you’re on a Linux system, and need to script something with the operating system, bash is probably going to be the first tool you reach for."

Bash programming is basically for light task automation, especially tasks that are close to the OS system calls. In this specific area there is not really a serious contender it seems (for unix systems). "But if we are writing 100 or more lines in our script we would probably be better of using Python/Perl/Go etc."

Bash is not really ment to be for high performance, it's made for automation (both the shell itself and the scripting). If we want higher performance there are other shells, but if we want high performance we would probably use C/C++/Rust instead of shell scripting to begin with.

# Google-search "Is Bash Dying?"
It's very clear on Quora etc, that it's definitly not. More and more tools are developed that does the job of bash (automation) in a specific area, but there will never established be tools for everything. And there are many alternatives for Bash like Perl, Python scripting, fish, etc but most of these cannot totally replace bash. Even if there is some tool that aims to entirely replace bash it will take many decades before that happens.

# Two different ways of replacing Bash
- There are different shells, like fish, ZSH, KSH and more who can replace bash. But I honestly think that none of these are even close to doing so.
- Instead of using a shell script you can use another scripting language like Perl, Python, Go etc. Actually you could write any program in any language to automate your tasks although scripting languages are usually more useful in terms of automating workflows.

Actually, as long as Bash keeps the throne as a shell it will always be useful as a scripting language since everyone will already know the commands (just add a little bit of script syntax) from working in the command line.

# Fish vs Bash
Fish Is A Modern Shell For The Sophisticated User. -> Not as good for not advanced users and it is not used at all as much in industry. It also sounds like it is a bit too much sophisticated.... I can imagine many of the extra features taking more CPU cycles and RAM etc.

# KSH vs Bash
"KSH is a great shell. It was/is the default shell on IBM AIX. However it does require some getting used to before you get comfortable using it and that is not great for a beginner learning the shell. It's makes more sense for intermediate or experienced system admins or users."

# Python vs Bash
Python can be easier to use especially if we want to build a bigger project with OOP and so on. But Python can't handle communication between programs the way bash can. If you SSH into some unix computer you also can't assume that Python is installed and maybe you don't want to install things since it's not your computer or maybe you just have lack of disk space etc. You can normally assume that bash is set up though. Even when python is installed you have to install different modules and you directly end up with lot's of extra version dependency as well. On the other hand bash is of course only installed in unix systems while python is portable to Windows (or probably any other random OS) as well.

These arguments basically apply to other scripting languages as well like Ruby, Perl, Go, JavaScript, or any other language really.

# Perl vs Bash
Perl seems to be more closely resambling shell programming and it is more powerful than bash with more features. But similarly as for python it is meant to be used for more advanced scripts and projects. If you are a DevOps engineer who writes advanced scripts every day you probably want to use Perl/Groovy/G/Python etc to increase efficiency. But again, if you want to do simple tasks as a developer there is not really any reason to make things unneccesarily complicated. You can kind of assume that other developers understand bash or at least can learn it enough to solve a simple task. You can add a bash script to a program without anyone raising an eyebrow. The same thing cannot be said with Go/Perl/Groovy. It's more difficult to learn and one developer might prefer groovy over perl while another one prefers perl and you don't want to have a project with all kinds of different languages used. Also, again, bash can usually be used without having to install a new program! 
