vim9script noclear

g:file_types = {
  asm: "Assembly",
  css: "CSS",
  html: "HTML",
  javascript: "JavaScript",
  javascriptreact: "JavaScript",
  json: "JSON",
  jsonc: "JSON with Comments",
  php: "PHP",
  scss: "S(CSS)",
  typescript: "TypeScript",
  typescriptreact: "TypeScript",
  vim: "Vim script",
}

augroup setup_file_types
  autocmd!
  autocmd BufRead,BufNewFile coc-settings.json setlocal filetype=jsonc
  autocmd FileType c,cpp &l:commentstring = "// %s"
augroup END
