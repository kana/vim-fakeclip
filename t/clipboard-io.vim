runtime! t/helpers/bootstrap.vim

describe 'fakeclip'
  context 'on Mac'
    it 'can read/write the clipboard'
      ExpectedPlatform Mac

      call Call('s:write_clipboard_mac', "Foo\nBar\nBaz")
      Expect Call('s:read_clipboard_mac') ==# "Foo\nBar\nBaz"
    end
  end

  context 'on WSL'
    it 'can read/write the clipboard'
      ExpectedPlatform WSL

      call Call('s:write_clipboard_wsl', "Foo\nBar\nBaz")
      Expect Call('s:read_clipboard_wsl') ==# "Foo\nBar\nBaz"
    end
  end

  context 'on Cygwin'
    it 'can read/write the clipboard'
      ExpectedPlatform Cygwin

      call Call('s:write_clipboard_cygwin', "Foo\nBar\nBaz")
      Expect Call('s:read_clipboard_cygwin') ==# "Foo\nBar\nBaz"
    end
  end

  context 'on X'
    it 'can read/write the clipboard'
      ExpectedPlatform X

      call Call('s:write_clipboard_x', "Foo\nBar\nBaz")
      Expect Call('s:read_clipboard_x') ==# "Foo\nBar\nBaz"
    end
  end

  context 'on lemonade'
    it 'can read/write the clipboard'
      ExpectedPlatform lemonade

      call Call('s:write_clipboard_lemonade', "Foo\nBar\nBaz")
      Expect Call('s:read_clipboard_lemonade') ==# "Foo\nBar\nBaz"
    end
  end
end
