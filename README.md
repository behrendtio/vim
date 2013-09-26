# Vim Configuration

*ATTENTION: Use at your own risk! Tested with Vim 7.2 and newer.*


## Requirements

Some of the installed plugins require ruby to be installed and available in your $PATH.

If you want to use the distraction free writing mode (Control-F10), you also need the
[Cousine](http://www.fontsquirrel.com/fonts/cousine) font.


## Installation

### Short version

Use the following code to grep the repo and symlink it.

```bash
$ git clone --recursive https://github.com/behrendtio/vim.git ~/.vim && ln -fs ~/.vim/vimrc ~/.vimrc
```

### Long version

* `cd` into your home directory, create a backup of your .vim folder and your .vimrc file, checkout the repository.

```bash
$ cd ~
$ mv .vim .vim_backup
$ mv .vimrc .vimrc_backup
$ git clone https://github.com/behrendtio/vim.git .vim
```

* Initialize git submodules.

```bash
$ cd ~/.vim
$ git submodule update --init
```

* Create a symlink to the vimrc file in the .vim folder.

```bash
$ ln -fs ~/.vim/vimrc ~/.vimrc
```

* Restart (G)Vim.

## Screenshots

### Normal mode

![](https://i.cloudup.com/iBVvKEJFy6.png)

### Distraction free mode

![](https://i.cloudup.com/MJmyXKlF1E.png)
