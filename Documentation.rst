Documentation
=============

Available self defined shortcuts and mappings
---------------------------------------------

.. list-table::
    :header-rows: 1
    :widths: 1 2

    * - **Command**
      - **Description**

    * - :w!!
      - Save file using sudo command

    * - jj
      - Wrapper for Esc to easily leave insert mode

    * - CTRL-S
      - Bad bad saving using simple editors shortcut

    * - CTRL-C
      - Close current buffer, Wrapper for :bd

    * - ,o
      - Open FuzzyFinder file search (may take a while on big projects the first time)

    * - ,b
      - Open FuzzyFinder buffer search - really helpful when dealing with dozens of buffers

    * - ,g
      - Toggle Gundo window (description under plugins chapter)

    * - ,n
      - Toggle NERDTree window

    * - ,Space
      - Switch to alternate buffer - very handy when switching between two files (e.g. class and test) back and forth

    * - ,v
      - Open .vimrc file in a new tab

    * - ,u
      - Open MRU window to display last opened files

    * - ,l
      - Open Taglist window - kind of file outline

    * - ,d
      - Generate phpdoc for method/class/var under the cursor

    * - ,s
      - Invoke tag search

    * - ,c
      - Rebuild ctags file - based on the currently active directory, check with *:pwd*

    * - ,j
      - Jump to tag under cursor based on ctags file

    * - ,r
      - Run current file through PHP interpreter

    * - ,rl
      - Run current file through PHP linter (syntax checking)

    * - ,p
      - Run current file through phpunit (needs a *tests* folder under root)

    * - ,P
      - Run whole project through phpunit (again a *tests* folder is required)

    * - ,op
      - Try to current files corresponding unit test (as of writing this only works for Zend Framework based
        structure)

    * - ,xx
      - Open a rST scratch buffer on your desktop - useful for quick notes

    * - ,f
      - Re-format whole file based on filetype - works greate for xml, php, ruby an so on (yaml is a pain in the ass...)

    * - ,qq
      - Compile current file with rst2pdf and open corresponding PDF file with evince (linux document viewer, should be
        tweaked if other viewers or operating system are used)

    * - ,xl
      - Run current file through XML linter (syntax check)

    * - ,t
      - Open todo file from Dropbox in a new tab

    * - ,dos
      - Re-open current file using windows line endings - VERY handy when working with those vista and xp guys from the
        other side...

    * - ,h1 / ,h2 / ,h3
      - Inserts rst headline marks under the current line - no column counting any more :)
        h1: ===
        h2: ---
        h3: ~~~

Installed plugins
-----------------

.. list-table::
    :header-rows: 1
    :widths: 1 2

    * - **Plugin**
      - **Short description**

    * - SnipMate
      - Basic snippet engine like those in eclipse or textmate

    * - FuzzyFinder
      - Powerful fuzzy finding engine for files, buffers and a lot of other things

    * - L9
      - Functional library required by FuzzyFinder

    * - Gundo
      - A graphical representation of Vims branching history, your vim internal repository - really great for coding!

    * - Latex-Suite
      - Well known latex suite with many shortcuts and features

    * - NERDtree
      - The missing (awesome) file explorer in Vim - simple and feature rich

    * - Taglist
      - A basic outline like representation of the current class/file

    * - XMLEdit
      - Small plugin which provides useful xml behaviour like auto closing tags

    * - Fugitive
      - Best.Git.Plugin.Ever

    * - MRU
      - List of last edited files

    * - Pastie
      - Send single lines, ranges and visual selections directly to pastie

    * - PHP documentor
      - Generates phpdoc blocks, as mentioned in the shortcuts table (,d)

    * - Better PHP completion
      - Provides a better php completion behaviour then Vims own one

    * - Unimpaired
      - Pairs of handy bracket mappings

Upgrading plugins
-----------------

You can easily upgrade all submodules using my `updateSubmodules.sh` script,
which comes shipped with this repo. To do so, just make the script executable
and run it. At the end you will be asked if you want to delete the created log
file - if you hit the enter key the log will be deleted, cause 'Yes' is the
default answer, so be careful :) ::

    cd ~/.vim
    chmod +x updateSubmodules.sh
    ./updateSubmodules.sh

Not installed, but interesting/promising
----------------------------------------

* **0scan**
* Autoclose
* Conque-Term
* PIV https://github.com/spf13/PIV
* AutocloseTag
* SuperTab
* Matchit
