# Vim Configuration

*ATTENTION: Use at your own risk! Tested with Vim 7.2 and newer.*


## Requirements

Some of the installed plugins require ruby to be installed and available in your $PATH.


## Installation

### Short version

Use the following code to grep the repo and symlink it.

```bash
$ git clone --recursive git://github.com/mbehrendt/vim.git ~/.vim && ln -fs ~/.vim/vimrc ~/.vimrc
```

### Long version

* `cd` into your home directory, create a backup of your .vim folder and your .vimrc file, checkout the repository.

```bash
$ cd ~
$ mv .vim .vim_backup
$ mv .vimrc .vimrc_backup
$ git clone git://github.com/mbehrendt/vim.git .vim
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
