function SetautoIndent()
   let min_indent = 0
   for i in range(1, line('$'))
      let cur_line = getline(i)
      if cur_line =~ '\v\s+.+ \.$'
         let cur_indent = indent(i)
         if !min_indent | let min_indent = cur_indent | endif
         let min_indent = min([cur_indent, min_indent])
      endif
   endfor
   if !min_indent | let min_indent = 2 | endif

   set expandtab
   execute 'set tabstop=' . min_indent
   execute 'set softtabstop=' . min_indent
   execute 'set shiftwidth=' . min_indent
   return min_indent
endfunction

augroup xi
  au BufEnter,BufNewFile,BufRead,BufWrite  *.xi let b:indent = SetautoIndent()
augroup END