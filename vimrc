" Initiate pathogen plugin
filetype off
set nocp
execute pathogen#infect()

" Fix for long loadtime when opening ruby files (see http://goo.gl/iGWs9)
if !empty($MY_RUBY_HOME)
    let g:ruby_path = join(split(glob($MY_RUBY_HOME.'/lib/ruby/*.*')."\n".glob($MY_RUBY_HOME.'/lib/ruby/site_ruby/*'),"\n"),',')
endif

" Include all necessary files
source ~/.vim/functions.vim
source ~/.vim/settings.vim
source ~/.vim/abbr.vim
source ~/.vim/keybindings.vim

call CheckForUpgrade()
