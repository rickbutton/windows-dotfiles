set rtp+=~/.cache/fzf
set rtp+=c:/git/dotfiles/vundle

call vundle#begin()
Plugin 'dracula/vim'
Plugin 'tomasiser/vim-code-dark'
"Plugin 'Omnisharp/omnisharp-vim'
Plugin 'nickspoons/omnisharp-vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'ervandew/supertab'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/vimfiler.vim'
Plugin 'vim-airline/vim-airline'
call vundle#end()

filetype plugin indent on

set splitbelow
set splitright
set number

let g:python_host_prog = 'C:\Python27\python.exe'
let g:python3_host_prog = 'C:\Python36-32\python.exe'

let g:SuperTabDefaultCompletionType = 'context'
let g:SuperTabContextDefaultCompletionType = "<C-x><C-o>"
let g:SuperTabDefaultCompletionTypeDiscovery = ["&omnifunc:<c-x><c-o>","&completefunc:<c-x><c-n>"]
let g:SuperTabClosePreviewOnPopupClose = 1

let g:OmniSharp_server_path = 'c:\git\dotfiles\neovim\omnisharp\OmniSharp.exe'
let g:OmniSharp_server_type = 'roslyn'
let g:OmniSharp_timeout = 10
let g:OmniSharp_selector_ui = 'fzf'
let g:OmniSharp_fetch_full_documentation = 1
let g:OmniSharp_want_snippet = 0

set noshowmatch
set completeopt=longest,menuone,preview
let g:syntastic_cs_checkers = ['code_checker']

let g:airline_theme = 'dracula'
let g:airline#extensions#tabline#enabled = 1

set updatetime=500
set cmdheight=2
set hidden

set tabstop=8 softtabstop=0 noexpandtab shiftwidth=4 smarttab

let mapleader=" "

augroup omnisharp_commands
    autocmd!

    autocmd FileType cs setlocal omnifunc=OmniSharp#Complete

    autocmd BufEnter,TextChanged,InsertLeave *.cs SyntasticCheck
augroup END

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

tnoremap <Esc> <C-\><C-N>

nnoremap <leader>th :tabfirst<CR>
nnoremap <leader>tj :tabnext<CR>
nnoremap <leader>tk :tabprev<CR>
nnoremap <leader>tl :tablast<CR>
nnoremap <leader>tc :tabclose<CR>
nnoremap <leader>te :tabedit<Space>

nnoremap <leader>ff :Files<cr>

nnoremap <leader>ss :OmniSharpStartServer<cr>
nnoremap <leader>sp :OmniSharpStopServer<cr>
nnoremap <leader>th :OmniSharpHighlightTypes<cr>
nnoremap <leader>ft :OmniSharpFindType<cr>
nnoremap <leader>fs :OmniSharpFindSymbol<cr>
nnoremap <leader>fu :OmniSharpFindUsages<cr>
nnoremap <leader>fm :OmniSharpFindMembers<cr>

nnoremap <leader>xu :OmniSharpFixIssue<cr>
nnoremap <leader>xu :OmniSharpFixUsings<cr>

nnoremap <leader>tt :OmniSharpTypeLookup<cr>
nnoremap <leader>dd :OmniSharpDocumentation<cr>

nnoremap <leader>nd :OmniSharpGotoDefinition<cr>
nnoremap <leader>nj :OmniSharpNavigateDown<cr>
nnoremap <leader>nk :OmniSharpNavigateUp<cr>

nnoremap <leader>le :VimFilerExplorer<cr>

syntax on
set background=dark
colorscheme dracula
autocmd VimEnter * colorscheme dracula
