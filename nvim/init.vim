" Set s:home to current directory and add to runtimepath
let s:home = fnamemodify(resolve(expand('<sfile>:p')), ':h')
exec 'set rtp+='.s:home

command! -nargs=1 VimLoad exec 'source '.s:home.'/config/'.'<args>'.'.vim'
command! -nargs=1 LuaLoad exec 'luafile '.s:home.'/config/'.'<args>'.'.lua'

VimLoad basic
VimLoad plugs
VimLoad looknfeel

VimLoad neoterm
LuaLoad neoterm
VimLoad nvim-compe
LuaLoad nvim-lspconfig
LuaLoad telescope.nvim
VimLoad treesitter
LuaLoad treesitter

" Maps ,tt to what is defined here
" Tmap rspec echo 'hi'

" Needs to be last to ensure that our mappings take priority
VimLoad mappings
" VimLoad terminal

" `vim --cmd 'profile start initvim-profiling.result' --cmd 'profile! file
