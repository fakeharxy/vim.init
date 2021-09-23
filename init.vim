filetype plugin on " Filetype detection is on

call plug#begin('~/.config/nvim/plugins')
Plug 'ggandor/lightspeed.nvim' " sneak replacement
Plug 'tpope/vim-rails' " allows switching from file to spec
Plug 'tpope/vim-commentary' " leader / comments lines in almost any file
Plug 'tpope/vim-abolish' " allows different matchers for substitution
Plug 'tpope/vim-surround' " allows key bindings for surrounding text
Plug '/usr/local/opt/fzf' " fuzzy finder engine
Plug 'junegunn/fzf.vim' " fuzzy finder engine
Plug 'frazrepo/vim-rainbow' " colours brackets by indentation
Plug 'sjl/gundo.vim' "power undo
Plug 'nvim-lua/plenary.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'qpkorr/vim-bufkill' "close buffers without closing splits
Plug 'romainl/vim-cool' "changes how highlighting works
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
Plug 'hrsh7th/nvim-compe'
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
Plug 'neovim/nvim-lspconfig'
Plug 'kdheepak/lazygit.nvim'
Plug 'arcticicestudio/nord-vim'
Plug 'preservim/vimux'
Plug 'vim-test/vim-test'
Plug 'slim-template/vim-slim'
call plug#end()

let g:mapleader = "\<Space>" " my leader is spacebar

colorscheme nord
set termguicolors
set background=dark

" all the backup, swaps and undos
set backup
set undofile
set backupdir=~/.config/nvim/backup//
set directory=~/.config/nvim/swap//
set undodir=~/.config/nvim/undo//

" tab stuff
set tabstop=2 shiftwidth=2
set expandtab

" search with / stuff
set hlsearch
set ignorecase
set smartcase
set ignorecase

" speeding up rendering stuff
set lazyredraw
set ttyfast
set scrolloff=10
set laststatus=2

set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set cursorline
set backspace=indent,eol,start

set number

set gdefault
set showmatch
set clipboard=unnamedplus

scriptencoding utf-8
set modelines=0
set autoread
set updatetime=300
set timeoutlen=1000 ttimeoutlen=0
set tags=./tags,tags;$HOME

set winwidth=84

set wrap
set breakindent
set breakindentopt=shift:2
set showbreak=↳

set linebreak
set colorcolumn=85
set splitright
set splitbelow
set nostartofline

" some nice formatting for syntax
set list listchars=tab:\|»,trail:·
set fillchars+=vert:\|

let g:rainbow_active = 1

let g:gundo_width = 60

inoremap <expr> <C-j> ((pumvisible())?("\<C-n>"):("j"))
inoremap <expr> <C-k> ((pumvisible())?("\<C-p>"):("k"))

" all my special leaders

" alternate file (test, usually)
nmap     <Leader>a :A<CR>

" buffer (load buffer)
noremap  <leader>b :source ~/.vim/shutdown_session.vim<CR>

noremap  <Leader>c :Commentary<CR>

nnoremap <leader>d "_dd
vnoremap <leader>d "_dd

nnoremap <leader>e <cmd>CHADopen<cr>

nnoremap <Leader>ff :Buffer<CR>
nnoremap <Leader>fd :GFiles?<CR>
nnoremap <Leader>fb :DiffBranch master<CR>
nnoremap <Leader>fv :ViewViews<CR>
nnoremap <Leader>fc :ViewControllers<CR>
nnoremap <Leader>fm :ViewModels<CR>
nnoremap <Leader>fs :ViewServices<CR>
nnoremap <Leader>fw :ViewWorkers<CR>
nnoremap <Leader>ft :ViewSpecs<CR>
nnoremap <Leader>fa :ViewFactories<CR>
map      <leader>fr :topleft :split config/routes.rb<cr>
map      <leader>fg :topleft 100 :split Gemfile<cr>

nnoremap <Leader>gb :Gitsigns toggle_current_line_blame<CR>
nnoremap <Leader>gg :LazyGit<CR>

map      <leader>h :PromoteToLet<cr>

nnoremap <silent> <leader>i :<C-u>call append(line("."),   repeat([""], v:count1))<CR>
nnoremap <silent> <leader>I :<C-u>call append(line(".")-1, repeat([""], v:count1))<CR>

nnoremap <Leader>j J

noremap  <Leader>k /\vend<cr>:noh<cr>

nnoremap <Leader>ll :Ag 
nnoremap <Leader>lr :Ag <C-p><CR>
nnoremap <Leader>lw :Ag <C-R><C-W><CR>
nnoremap <Leader>ld :Ag def <C-R><C-W><CR>
nnoremap <Leader>lc :Ag class <C-R><C-W><CR>
nnoremap <Leader>lm :Ag module <C-R><C-W><CR>
nnoremap <leader>lv :e $MYVIMRC<CR>
nnoremap <leader>lz :e ~/.zshrc<CR>
nnoremap <leader>ls :source $MYVIMRC<CR>


map      <Leader>nf :call RenameFile()<cr>
map      <Leader>nv :call Rnvar()<cr>

nnoremap <Leader>m <CR>

nnoremap <Leader>o :tabe<CR>

map      <Leader>p :set paste<CR>o<esc>"*]p:set nopaste<cr>

nnoremap <Leader>q :q<CR>

nmap     <Leader>s *

nmap     <Leader>tt :wa<CR>:TestFile<CR>
nmap     <Leader>tr :wa<CR>:TestLast --fail-fast<CR>
nmap     <Leader>tl :wa<CR>:TestNearest<CR>

nnoremap <leader>u :GundoToggle<CR>

nnoremap <Leader>vv <C-w>v<C-w>l<CR>
nnoremap <Leader>vh :sp<CR>
nnoremap <Leader>va <C-w>v<C-w>l :A<CR>
nnoremap <Leader>vd :only<CR><C-w>v<C-w>l :A<CR>
nnoremap <Leader>vq :xa<CR>
nnoremap <Leader>vw :wa<CR>

nnoremap <Leader>w :w<CR>

map      <Leader>x :BD!<CR>
map      <leader>,x :%bd\|e#<CR>

nnoremap <Leader>y :call InlineVariable()<CR>

nnoremap <Leader>z <C-W>=
nnoremap <Leader>,z <C-W>\|<C-W>_

nnoremap gp `[v`]
nnoremap <CR> gg
vnoremap <CR> gg
nnoremap E ge
nnoremap - -

nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>

autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 1000)
autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting_sync(nil, 1000)
autocmd BufWritePre *.rb lua vim.lsp.buf.formatting_sync(nil, 1000)

let test#strategy = "vimux"

autocmd VimEnter * COQnow --shut-up

lua << EOF
require'lspconfig'.tsserver.setup{}
require'lspconfig'.solargraph.setup{}
require('gitsigns').setup {
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 10,
  },
}
EOF
let g:chadtree_settings = {
            \   'keymap' : {
            \       'primary' : ['o', '<CR>'],
            \       'v_split' : ['O'],
            \       'open_sys' : ['i'],
            \       },
            \   'theme' : {
            \       'text_colour_set': 'nord'
            \       }
            \}

nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

command! -bang ViewViews call fzf#vim#files('./app/views', <bang>0)
command! -bang ViewControllers call fzf#vim#files('./app/controllers', <bang>0)
command! -bang ViewModels call fzf#vim#files('./app/models', <bang>0)
command! -bang ViewServices call fzf#vim#files('./app/services', <bang>0)
command! -bang ViewWorkers call fzf#vim#files('./app/workers', <bang>0)
command! -bang ViewSpecs call fzf#vim#files('./spec', <bang>0)
command! -bang ViewFactories call fzf#vim#files('./spec/factories', <bang>0)

function! s:list_branches(typed, ...)
  let branches = systemlist('git branch | cut -c 3-')
  if empty(a:typed)
    return branches
  endif
  return filter(branches, { idx, val -> stridx(val, a:typed) >= 0 })
endfunction

function! s:diff_branch(branch)
  let branch = len(a:branch) ? a:branch : 'master'
  let source = 'git diff --name-status ' .. branch
  let preview = 'git diff --color=always ' .. branch .. ' -- {-1}'
  let spec = { 'source': source, 'options': ['--preview', preview] }
  function spec.sink(match)
    execute 'e' split(a:match, "\t")[-1]
  endfunction

  call fzf#run(fzf#wrap(spec))
endfunction

command! -nargs=? -complete=customlist,s:list_branches DiffBranch call s:diff_branch(<q-args>)

nnoremap ,<Space> <c-^>

nmap H ^
nmap L $

imap kj <Esc>:w<CR>
map q: :q

map Y y$

nnoremap <leader><space> :GFiles<CR>

nnoremap \ :Ag<Space>

vnoremap p "_dP

nnoremap / /\v
vnoremap / /\v

nnoremap J 30gjzz
nnoremap K 30gkzz
nnoremap # #zz
nnoremap * *zz
nnoremap n nzz
nnoremap N Nzz

nnoremap <expr> j v:count ? (v:count > 5 ? "m'" . v:count : '') . 'j' : 'gj'
nnoremap <expr> k v:count ? (v:count > 5 ? "m'" . v:count : '') . 'k' : 'gk'

" Autocomplete menu options
set completeopt=menuone,noselect,noinsert
set noshowmode
set shortmess+=c

" Set recommended to false
let g:coq_settings = { "keymap.recommended": v:false, "keymap.jump_to_mark": '<C-e>', "keymap.bigger_preview": "<C-p>"}

" Keybindings
ino <silent><expr> <esc>   pumvisible() ? "\<c-e><esc>" : "\<esc>"
ino <silent><expr> <c-c>   pumvisible() ? "\<c-e><c-c>" : "\<c-c>"
ino <silent><expr> <bs>    pumvisible() ? "\<c-e><bs>"  : "\<bs>"
ino <silent><expr> <cr>    pumvisible() ? (complete_info().selected == -1 ? "\<c-e><cr>" : "\<c-y>") : "\<cr>"
ino <silent><expr> <tab>   pumvisible() ? "\<c-n>" : "\<tab>"
ino <silent><expr> <s-tab> pumvisible() ? "\<c-p>" : "\<bs>"

autocmd bufreadpost quickfix nnoremap <buffer> <cr> <cr>:cclose<cr>

nnoremap c "_c
vnoremap c "_c
nnoremap c "_c
vnoremap c "_c

autocmd VimLeave * mksession! ~/.vim/shutdown_session.vim

if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

if has('nvim')
  tmap <C-o> <C-\><C-n>
endif

function! InlineVariable()
    " Copy the variable under the cursor into the 'a' register
    :let l:tmp_a = @a
    :normal "ayiw
    " Delete variable and equals sign
    :normal 2daW
    " Delete the expression into the 'b' register
    :let l:tmp_b = @b
    :normal "bd$
    " Delete the remnants of the line
    :normal dd
    " Go to the end of the previous line so we can start our search for the
    " usage of the variable to replace. Doing '0' instead of 'k$' doesn't
    " work; I'm not sure why.
    normal k$
    " Find the next occurence of the variable
    exec '/\<' . @a . '\>'
    " Replace that occurence with the text we yanked
    exec ':.s/\<' . @a . '\>/' . escape(@b, "/")
    :let @a = l:tmp_a
    :let @b = l:tmp_b
endfunction

function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction

function! VimuxCreateNewPane()
  let splitExitCode = system("tmux split-window")
endfunction

function! PromoteToLet()
  :normal! dd
  :normal! P
  :.s/\(\w\+\) = \(.*\)$/let(:\1) { \2 }/
endfunction
:command! PromoteToLet :call PromoteToLet()

" Function to rename the variable under the cursor
function! Rnvar()
  let word_to_replace = expand("<cword>")
  let replacement = input("new name: ")
  execute '%s/\(\W\)' . word_to_replace . '\(\W\)/\1' . replacement . '\2/gc'
endfunction

function! InsertStatuslineColor(mode)
  if a:mode == 'i'
    hi statusline guibg=Green ctermfg=2 guifg=Black ctermbg=0
  else
    hi statusline guibg=Cyan ctermfg=6 guifg=Black ctermbg=0
  endif
endfunction

au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertLeave * hi statusline guibg=DarkGrey ctermfg=8 guifg=White ctermbg=15

" default the statusline to grey when entering vim
hi statusline guibg=DarkGrey ctermfg=8 guifg=White ctermbg=15
hi StatusLineNC ctermfg=Black ctermbg=White cterm=NONE

set shell=/bin/sh

set statusline=\ \ \ \ %{expand('%:p:h:t')}/%t\ \[%{getbufvar(bufnr('%'),'&mod')?'modified':'saved'}]
