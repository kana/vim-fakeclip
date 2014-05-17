runtime! plugin/fakeclip.vim
call vspec#hint({
\   'scope': 'fakeclip#_local_variables()',
\   'sid': 'fakeclip#_sid_prefix()',
\ })

command! -nargs=0 OnlyForClipboardAvailablePlatform
\   if Ref('s:PLATFORM') ==# 'unknown'
\ |   SKIP 'not supported platform'
\ | end

describe '<Plug>(fakeclip-d)'
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
    map <buffer> "@d  <Plug>(fakeclip-d)
  end

  after
    close!
  end

  context "with 'noignorecase'"
    before
      set noignorecase
    end

    after
      set ignorecase&
    end

    it 'targets a right region if combined with a characterwise motion'
      OnlyForClipboardAvailablePlatform

      normal 2G"@dw
      Expect Call('s:read_clipboard') ==# 'sed '
    end

    it 'targets a right region if combined with a characterwise motion'
      OnlyForClipboardAvailablePlatform

      normal 3Gvwww"@d
      Expect Call('s:read_clipboard') ==# 'aliqua. Ut e'
    end
  end

  context "with 'ignorecase'"
    before
      set ignorecase
    end

    after
      set ignorecase&
    end

    it 'targets a right region if combined with a characterwise motion'
      OnlyForClipboardAvailablePlatform

      normal 4G"@dw
      Expect Call('s:read_clipboard') ==# 'ullamco '
    end

    it 'targets a right region if combined with a characterwise motion'
      OnlyForClipboardAvailablePlatform

      normal 5Gvwww"@d
      Expect Call('s:read_clipboard') ==# 'Duis aute irure d'
    end
  end
end
