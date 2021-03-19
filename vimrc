set nocompatible
syntax on

" Indents.
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set si

" Line numbers.
set number
set ruler

" Search.
set incsearch
set hlsearch

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors
set background=dark
colorscheme my_theme

" Vim will jump to the last position when reopening a file.
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Allow tabs in Makefiles.
autocmd FileType make,automake set noexpandtab shiftwidth=8 softtabstop=8

" Trailing whitespace and tabs are forbidden, so highlight them.
highlight ForbiddenWhitespace ctermbg=yellow guibg=#c7e75f
match ForbiddenWhitespace /\s\+$\|\t/
" Do not highlight spaces at the end of line while typing on that line.
autocmd InsertEnter * match ForbiddenWhitespace /\t\|\s\+\%#\@<!$/

" Custom syntax options.
let g:cpp_class_decl_highlight = 1
let g:cpp_class_scope_highlight = 1

" Mouse, split-dragging enabled.
set mouse=a
set ttymouse=xterm2
