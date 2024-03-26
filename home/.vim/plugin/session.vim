vim9script noclear

if !g:development
  finish
endif

import autoload "utils.vim"

if utils.IsLoaded("session")
  finish
endif
g:loaded_session = true

set sessionoptions-=options 

g:session_cache_dir = $"{$HOME}/.cache/vim/session"
var session_file = getcwd()->substitute("\/", "__", 'g')
var session = $"{g:session_cache_dir}/{session_file}.vim"

if !isdirectory(g:session_cache_dir)
  mkdir(g:session_cache_dir)
  Notify $"Created session directory at {g:session_cache_dir}"
endif

def SaveSession(): void
  var choice = confirm("Save this session?", "&Yes\n&No")
  if choice != 1
    return
  endif

  execute $"mksession! {session}"
enddef

def RestoreSession(): void
  if filereadable(session)
    execute $"source {session}"
  endif
enddef

def DeleteSession()
  execute $"Rm {session}"
enddef

augroup sessionize
  autocmd!
  autocmd VimLeave * SaveSession()
  autocmd VimEnter * ++nested RestoreSession()

  # Remembers last cursor position.
  autocmd BufReadPost * {
    if line("'\"") >= 1 && line("'\"") <= line("$") && &filetype !~# 'commit'
        && index(['xxd', 'gitrebase'], &filetype) == -1
      execute "normal! g`\""
    endif
  }
augroup END

command! SaveSession    SaveSession()
command! Sav            SaveSession()

command! DeleteSession  DeleteSession()
command! Del            DeleteSession()
