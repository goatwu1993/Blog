---
title: "Setting Up Your MacOS : Vim & Vimrc"
date: 2018-05-06T04:51:07+08:00
draft: false
categories: [Development]
tags: [Linux, MacOS, Environment, Vim, Shell]
slug: Setting-Up-Your-Mac-OS-Vim-and-Vimrc
gitment: true
---



Things started at one of my friends brought a Macbook Pro (Apple) same as mine, and I will like to set up a environment like mine.

First you may want to edit some file in your terminal like a HACKER-MAN, and Vim is the most use text editor in terminal.

So let's get started!

## Open your terminal.‌

You can found it simply type "terminal" in your spotlight.

## (Optional) Open Vim and see what is vimrc.  
In your Mac terminal, either you type vi or vim will both open vim.
`$ vim --version`‌
To see the version of vim, and where the vimrc should be place.
`$ vi` or
`$ vim`‌ to open vim
Next, type :help vimrc in your Vim
`:help vimrc`  
Output:
> A file that contains initialization commands is called a "vimrc" file. Each line in a vimrc file is executed as an Ex command line. It is sometimes also referred to as "exrc" file. They are the same type of file, but "exrc" is what Vi always used, "vimrc" is a Vim specific name. Also see |vimrc-intro|.  
> Places for your personal initializations:  
> Unix : $HOME/.vimrc or $HOME/.vim/vimrc  
> OS/2 : $HOME/.vimrc, $HOME/vimfiles/vimrc or $VIM/.vimrc (or _vimrc)  
> MS-Windows : $HOME/_vimrc, $HOME/vimfiles/vimrc or $VIM/_vimrc  
> Amigas : .vimrc, home:.vimrc, home:vimfiles:vimrc or $VIM/.vimrc  
> The files are searched in the order specified above and only the first one that is found is read.  
>RECOMMENDATION: Put all your Vim configuration stuff in the $HOME/.vim/ directory ($HOME/vimfiles/ for MS-Windows). That makes it easy to copy it to another system.  

vimrc as the config file of your Vim editor. Whenever you open your Vim, it will preload the settings in vimrc.

So let follow it's recommendation.
Type in :q twice to leave vim. The command always start with ":" in Vim. q means to quit vim.
`:q` then again `:q<`‌


## Go to your user home directory(~)
Now that we know what vimrc is for, and where to place it, let make our own vimrc. First you should change you location in the terminal from anywhere to your user's home directory with the command below.  
`$ cd ~`  
"cd" command stands for change directory and "~" stands for your user's home directory.‌ You should use ~ directory instead if root directory(/) to avoid disaster happen.

## Make a .vim directory in ~
So now since we are at our user's home directory, let's make the ".vim" directory with "mkdir" command. The ".vim" directory should be where you place all Vim relative file in.  
`$ mkdir .vim`
## (Optional) Check ~/.vim
The "." in the beginning means that the file is invisible either in the finder or "ls" command. To find the file, simply type "ls -la" to list out all directory & file no matter it start with a "." and be invisible.  
`$ ls -la`  
Or you could use pipe to grep the .vim directory  
`$ ls -la | grep .vim`  
`drwxr-xr-x   4 network5566 staff 136 Apr 9 14:40 .vim`

## CD to ~/.vim
cd into .vim directory  
`$ cd .vim`

## Create and Edit your vimrc file
Let's use Vim to edit your vimrc!  
`$ vim vimrc.`  
This will instantly create a vimrc file in the directory and open it with vim.‌ Then just EDIT your vimrc file like a BOSS.Press "i" botton to enter insert mode in Vim and paste the below  
`syntax on`
`set nu`  
`set ruler`  
`set ic`  
`set hlsearch`

syntax on will auto syntax your file when opening it with Vim.
set ruler will show the number when you move your cursor.
set ic allow your search to be non-case-sensitive.
set hlsearch make your search result highlight.‌‌‌‌
You can find other parameter on the Internet and this is just mine.
## Save and quit
Press "esc" to quit insert mode in Vim. Then in Vim type  
`:wq`  
Remember "q" means quitting Vim? The "w" parameter means you want to save the file with your change. Together you save the file and quit vim.‌

## Restart your terminal
Close and reopen your terminal and enjoy the Vim with your vimrc configuration!
