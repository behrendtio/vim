" Format whole file according to the filetype and vims syntax settings
function! FormatFile()
  execute "normal! mf"
  execute "normal! gg"
  execute "normal! =G"
  execute "normal! 'f"
endfunction

" Returns true if current file is a spec file
function! InSpecFile()
  return match(expand("%"), "_spec.rb$") != -1
endfunction

" Returns true if current file is a ruby test file
function! InRubyTestFile()
  return match(expand("%"), "_test.rb$") != -1
endfunction

" Run current file spec
function! RunCurrentTest()
  write
  if InSpecFile()
    execute '!clear; bin/rspec --no-color %'
  elseif InRubyTestFile()
    execute '!clear; ruby -Ilib -Itest %'
  endif
endfunction

" Check for vim config update
function! CheckForUpgrade()
  let g:VimConfigUpdateCheck = 1

  let g:VimConfigUpdateCheckLockFile = $HOME . '/.vim/updatecheck.lock' " Not working in windows - who cares...
  let g:VimConfigUpdateCheckDelay = 432000 " 5 days in seconds...

  if !g:VimConfigUpdateCheck
    return
  endif

  let current = localtime()
  if !filereadable(g:VimConfigUpdateCheckLockFile)
    call writefile([current], g:VimConfigUpdateCheckLockFile)
  else
    let content = readfile(g:VimConfigUpdateCheckLockFile)
    let lastcheck = content[0]+0 " Force conversion to number
    let nextcheck = lastcheck+g:VimConfigUpdateCheckDelay

    if current < nextcheck
      return
    else
      call writefile([current], g:VimConfigUpdateCheckLockFile)
    endif
  endif

  let output = "Vim configuration update checker\n--------------------------------\n\n"

  let cwd = getcwd()

  execute 'lcd '.$HOME.'/.vim'

  let remote = system("git ls-remote origin -h refs/heads/master | awk '{print $1}'")
  let local  = system("git rev-parse HEAD")

  if remote == local
    let output .= '**Nothing to update**'
  else
    let output .= '**You need an update!**'
    let output .= "\n\n\nGit output\n----------\n\n"
    let output .= system("git pull origin master")
    let output .= system("git submodule update --init")
    let output .= "\n==========================================\n"
    let output .= "You're up to date now (Please restart Vim)"
    let output .= "\n==========================================" 
  endif

  execute 'lcd '.cwd

  execute ':tabnew'

  silent put=output

  set filetype=rst
  set nomodified

  execute ':tabp'
  redraw
endfunction

" Switch between light and dark background
function! SwitchBackground()
  let &background = (&background == "dark"? "light" : "dark")
endfunction

" Returns branch in square brackets or empty string based on fugitive#head output
function! GitBranch()
  if !exists('*fugitive#head')
    return ''
  endif

  let branch = fugitive#head(7)

  if branch == ''
    return ''
  endif

  return '[' . branch . ']'
endfunction
