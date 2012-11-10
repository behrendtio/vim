" Initiate pathogen plugin
filetype off
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

" Fix for long loadtime when opening ruby files (see http://goo.gl/iGWs9)
if !empty($MY_RUBY_HOME)
    let g:ruby_path = join(split(glob($MY_RUBY_HOME.'/lib/ruby/*.*')."\n".glob($MY_RUBY_HOME.'/lib/ruby/site_ruby/*'),"\n"),',')
endif

" Include all necessary files
source ~/.vim/settings.vim
source ~/.vim/abbr.vim
source ~/.vim/keybindings.vim
source ~/.vim/functions.vim

call CheckForUpgrade()
