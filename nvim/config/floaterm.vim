" Start terminal windows in insert mode
autocmd TermOpen * startinsert

" Exit terminal mode
tnoremap <Esc><Esc> <C-\><C-n>

noremap  <leader>t  :FloatermToggle<CR>i
noremap! <leader>t  <Esc>:FloatermToggle<CR>i
tnoremap <leader>t  <Esc><Esc>:FloatermToggle<CR>
