## **figgit -** *a dotfile (config) git alias*  

___

This really is the simplest way to manage dotfiles. 

All you really need is for git to be installed on the local system.


* This method is is derived from [this thread on Hacker News](https://news.ycombinator.com/item?id=11071754).

* Atlassian has [a great write-up](https://www.atlassian.com/git/tutorials/dotfiles) using the information from the thread. 

* The Arch Linux Wiki also has a [section regarding dotfiles](https://wiki.archlinux.org/title/Dotfiles).


What you will learn here is not much different than what is provided in the above threads. The key differences being the fact that I chose to name my alias "figgit" because "config" never struck me as an appropriate name. Also, I named my dotfile bare git repo directory ".dotfiles" because it just makes the most sense.

*Note: This guide assumes you're using zsh as your shell and have git installed.*


[`^`](#)

___


# STEP 1:

### edit *~/.zshrc.local*

##### add the following:

```zsh
# dotfile (config) git repo - "figgit"
zstyle ':completion:*:*:git:*' user-commands figgit:'figgit dotfile git alias'
alias figgit='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```

[`^`](#)

___


# STEP 2:

### edit */usr/share/zsh/functions/Completion/Unix/_git*

##### replace the line containing: 

```zsh
(( $+opt_args[--git-dir] )) && local -x GIT_DIR=$opt_args[--git-dir]
```
##### with:

```zsh
(( $+opt_args[--git-dir] )) && local -x GIT_DIR=${(e)~opt_args[--git-dir]}

(( $+opt_args[--work-tree] )) && local -x GIT_WORKTREE=${(e)~opt_args[--work-tree]}
```

##### [source](https://unix.stackexchange.com/a/550566/453739)


[`^`](#)

___

# STEP 3:

### create the git bare repository

```zsh
git init --bare $HOME/.dotfiles
figgit config --local status.showUntrackedFiles no
```

### add some dotfiles to the repo

```zsh
figgit add .zshrc.local
figgit commit -m "~/.zshrc.local"

# remember to use your <tab> completion here :)

figgit add ~/.config/nvim/init.vim
figgit commit -m "init.vim"
```

### push to remote repo

```
figgit push
```

[`^`](#)


___
