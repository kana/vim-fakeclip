runtime! plugin/fakeclip.vim
call vspec#hint({
\   'scope': 'fakeclip#_local_variables()',
\   'sid': 'fakeclip#_sid_prefix()',
\ })

command! -nargs=0 OnlyForClipboardAvailablePlatform
\   if Ref('s:PLATFORM') ==# 'unknown'
\ |   SKIP 'not supported platform'
\ | end

describe '<Plug>(fakeclip-Y)'
  before
    new
    put =[
    \   'Lorem ipsum dolor sit amet, consectetur adipisicing elit,',
    \   'sed do eiusmod tempor incididunt ut labore et dolore magna',
    \   'aliqua. Ut enim ad minim veniam, quis nostrud exercitation',
    \   'ullamco laboris nisi ut aliquip ex ea commodo consequat.',
    \   'Duis aute irure dolor in reprehenderit in voluptate velit',
    \   'esse cillum dolore eu fugiat nulla pariatur. Excepteur sint',
    \   'occaecat cupidatat non proident, sunt in culpa qui officia',
    \   'deserunt mollit anim id est laborum.',
    \ ]
    1 delete _
    map <buffer> "@Y  <Plug>(fakeclip-Y)
  end

  after
    close!
  end

  context 'in Visual mode'
    it 'yanks text linewise'
      OnlyForClipboardAvailablePlatform

      normal 4Gvjj"@Y
      Expect Call('s:read_clipboard') ==#
      \   "ullamco laboris nisi ut aliquip ex ea commodo consequat.\n"
      \ . "Duis aute irure dolor in reprehenderit in voluptate velit\n"
      \ . "esse cillum dolore eu fugiat nulla pariatur. Excepteur sint\n"
    end
  end
end
