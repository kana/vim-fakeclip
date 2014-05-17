runtime! plugin/fakeclip.vim
call vspec#hint({
\   'scope': 'fakeclip#_local_variables()',
\   'sid': 'fakeclip#_sid_prefix()',
\ })

command! -nargs=1 Only
\   if Ref('s:PLATFORM') !=? <q-args>
\ |   SKIP 'not on the platform'
\ | end

describe 'fakeclip'
  context 'on Mac'
    it 'can read/write the clipboard'
      Only Mac

      call Call('s:write_clipboard_mac', "Foo\nBar\nBaz")
      Expect Call('s:read_clipboard_mac') ==# "Foo\nBar\nBaz"
    end
  end

  context 'on Cygwin'
    it 'can read/write the clipboard'
      Only Cygwin

      call Call('s:write_clipboard_cygwin', "Foo\nBar\nBaz")
      Expect Call('s:read_clipboard_cygwin') ==# "Foo\nBar\nBaz"
    end
  end

  context 'on X'
    it 'can read/write the clipboard'
      Only X

      call Call('s:write_clipboard_x', "Foo\nBar\nBaz")
      Expect Call('s:read_clipboard_x') ==# "Foo\nBar\nBaz"
    end
  end
end
