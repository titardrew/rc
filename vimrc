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

" Colorscheme. See :help group-name for details.
hi Search   ctermfg=Black ctermbg=LightMagenta
hi Constant ctermfg=LightYellow
hi Special  ctermfg=LightMagenta
hi Comment  ctermfg=Green
hi Todo     cterm=underline ctermfg=White
hi Error    cterm=underline ctermfg=Red

" Allow tabs in Makefiles.
autocmd FileType make,automake set noexpandtab shiftwidth=8 softtabstop=8

" Trailing whitespace and tabs are forbidden, so highlight them.
hi ForbiddenWhitespace ctermbg=red guibg=red
match ForbiddenWhitespace /\s\+$\|\t/
" Do not highlight spaces at the end of line while typing on that line.
autocmd InsertEnter * match ForbiddenWhitespace /\t\|\s\+\%#\@<!$/

" Mouse, split-dragging enabled.
set mouse=a
set ttymouse=xterm2

