" Initiate pathogen plugin
filetype off
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

" Include all necessary files
source ~/.vim/settings.vim
source ~/.vim/abbr.vim
source ~/.vim/keybindings.vim
source ~/.vim/functions.vim
source ~/.vim/playground.vim

call CheckForUpgrade()
