---
title: "Setting Up Your Mac OS : Vim & Vimrc"
date: 2018-05-06T04:51:07+08:00
draft: true
---



Things started at one of my friends brought a Macbook Pro (Apple) same as mine, and I will like to set up a environment like mine.

First you may want to edit some file in your terminal like a HACKER-MAN, and Vim is the most use text editor in terminal.

So let's get started!

<h2>Find and open your terminal.‌</h2>
You can found it simply type "terminal" in your spotlight.
<h2>(Optional) Open Vim and see what is vimrc.</h2>
In your Mac terminal, either you type vi or vim will both open vim.
<code>$ vim --version</code>‌
To see the version of vim, and where the vimrc should be place.
<code>$ vi</code> or
<code>$ vim</code>‌ to open vim
Next, type :help vimrc in your Vim
<code>:help vimrc</code>.
Should something like
<blockquote>A file that contains initialization commands is called a "vimrc" file. Each line in a vimrc file is executed as an Ex command line. It is sometimes also referred to as "exrc" file. They are the same type of file, but "exrc" is what Vi always used, "vimrc" is a Vim specific name. Also see |vimrc-intro|.

Places for your personal initializations:
Unix                $HOME/.vimrc
or $HOME/.vim/vimrc
OS/2                 $HOME/.vimrc, $HOME/vimfiles/vimrc
or $VIM/.vimrc (or _vimrc)
MS-Windows $HOME/_vimrc, $HOME/vimfiles/vimrc
or $VIM/_vimrc
Amiga              s:.vimrc, home:.vimrc, home:vimfiles:vimrc
or $VIM/.vimrc

The files are searched in the order specified above and only the first one that is found is read.
<p class="p1"><span class="s1">RECOMMENDATION: Put all your Vim configuration stuff in the </span><span class="s1">$HOME/.vim/ directory ($HOME/vimfiles/ for MS-Windows). That makes it</span><span class="s1"><span class="Apple-converted-space"> </span>easy to copy it to another system.</span></p>
</blockquote>
You can think vimrc as the config file of your Vim editor. Whenever you open your Vim, it will preload the settings in vimrc.

So let follow it's recommendation.
Type in :q twice to leave vim. The command always start with ":" in Vim. q means to quit vim.
<code>:q</code> then again <code>:q</code>‌


<h2> Go to your user home directory(~)</h2>
Now that we know what vimrc is for, and where to place it, let make our own vimrc. First you should change you location in the terminal from anywhere to your user's home directory with the command below.
<code>$ cd ~</code>
"cd" command stands for change directory and "~" stands for your user's home directory.‌ You should use ~ directory instead if root directory(/) to avoid disaster happen.
	<h2>Make a .vim directory in ~/</h2>
So now since we are at our user's home directory, let's make the ".vim" directory with "mkdir" command. The ".vim" directory should be where you place all Vim relative file in.
<code>$ mkdir .vim</code>‌
	<h2>(Optional) Check ~/.vim</h2>
The "." in the beginning means that the file is invisible either in the finder or "ls" command. To find the file, simply type "ls -la" to list out all directory & file no matter it start with a "." and be invisible.
<code>$ ls -la</code>
Or you could use pipe to grep the .vim directory
<code>$ ls -la | grep .vim
</code>
There should be a .vim directory
<code>drwxr-xr-x   4 network5566 staff 136 Apr 9 14:40 .vim</code>‌
	<h2>CD to ~/.vim</h2>
cd into .vim directory
<code>$ cd .vim</code>
	<h2>Create and Edit your vimrc file</h2>
Let's use Vim to edit your vimrc!<code>$ vim vimrc.</code>This will instantly create a vimrc file in the directory and open it with vim.‌ Then just EDIT your vimrc file like a BOSS.Press "i" botton to enter insert mode in Vim and paste the below
<code>syntax on
set nu
set ruler
set ic
set hlsearch</code>

syntax on will auto syntax your file when opening it with Vim.
set ruler will show the number when you move your cursor.
set ic allow your search to be non-case-sensitive.
set hlsearch make your search result highlight.‌‌‌‌
You can find other parameter on the Internet and this is just mine.
	<h2>Save and quit</h2>
Press "esc" to quit insert mode in Vim. Then in Vim type<code>:wq</code>Remember "q" means quitting Vim? The "w" parameter means you want to save the file with your change. Together you save the file and quit vim.‌
	<h2>Restart your terminal</h2>
Close and reopen your terminal and enjoy the Vim with your vimrc configuration!
