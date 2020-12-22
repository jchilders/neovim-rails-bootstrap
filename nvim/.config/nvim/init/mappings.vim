let mapleader = ","

" use jk for esc
imap jk <Esc>
vmap jk <Esc>

nnoremap <silent> <Leader>w :wa<CR>
nnoremap <silent> <Leader>W :wqa<CR>

" Ctrl-C to copy visual selection to pasteboard
vmap <silent> <C-c> "+y

" Change all occurences of the current word
nnoremap <Leader>cw :%s/\<<C-r><C-w>\>/<C-r><C-w>
vnoremap <Leader>cw y:%s/<C-r>"/<C-r>"

" Send selected text to terminal
" vmap <silent> <Leader>vs "vy :call VimuxSlime()<CR>
vmap <silent> <Leader>vs :TREPLSendSelection<CR>

" Send current line to terminal
" nmap <silent> <Leader>vs vip<Leader>vs<CR>
nmap <silent> <Leader>vs :TREPLSendLine<CR>

" gxip to send current paragraph/block to terminal
nmap gx <Plug>(neoterm-repl-send)

" use <Leader>L to toggle the displaying relative line number
function! g:ToggleNuMode()
  if(&rnu == 1)
    set nornu
  else
    set rnu
  endif
endfunc
nnoremap <Leader>l :call g:ToggleNuMode()<cr>

" Clear previously highlighted search ('clear find')
nnoremap <silent> <Leader>cf :let @/ = ''<CR>

" Toggle next/previous buffers
nnoremap <silent> <Leader><Leader> :b#<CR>

" Replace single quotes with doubles
nnoremap <Leader>rq :s/'/"/g<CR>:let @/ = ''<CR>

" lsp
imap <C-o> <Plug>(completion_trigger)

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
