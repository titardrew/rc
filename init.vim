" Inspired by https://jdhao.github.io/2020/11/29/neovim_cpp_dev_setup/

set nocompatible
syntax on

call plug#begin()

Plug 'prabirshrestha/vim-lsp'
Plug 'Shougo/deoplete.nvim'
Plug 'lighttiger2505/deoplete-vim-lsp'

" settings for vim-lsp
" llvm-project+clang must be installed
" ccls must be compiled.
if executable('ccls')
    au User lsp_setup call lsp#register_server({
      \ 'name': 'ccls',
      \ 'cmd': {server_info->['ccls']},
      \ 'root_uti': {server_info->lsp#utils#path_to_uri(
      \   lsp#utils#find_nearest_parent_file_directory(
      \     lsp#utils#get_buffer_path(), ['.ccls', 'compile_commands.json', '.git/']))},
      \ 'initialization_options': {
      \   'highlight': { 'lsRanges' : v:true },
      \   'cache': { 'directory': stdpath('cache') . '/ccls' },
      \ },
      \ 'whitelist': ['c', 'cpp', 'cc'],
      \ })
else
    echo "ccls (C++ language server) is not found!"
endif

Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'ludovicchabant/vim-gutentags'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'dracula/vim', {'as': 'dracula'}
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }


call plug#end()

let g:gutentags_ctags_tagfile = '.tags'
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px', '--c-kinds=+px']
nnoremap <leader>p :CtrlPTag<cr>
nnoremap <C-n> :NERDTreeToggle<cr>

" Indents.
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set si
set nowrap

" Line numbers.
set number
set ruler
set spell

" Search.
set incsearch
set hlsearch

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors
colorscheme dracula

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
