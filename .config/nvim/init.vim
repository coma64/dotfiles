" TODO: coc-lists, vimspector, coc, lua configuration, evilline, make all
" silent, cpp vimspector, fzf complete file https://github.com/junegunn/fzf.vim, make all vimspector mappings nnoremap, vert split bind

" Plugin Settings
" fzf
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
" polyglot
let g:polyglot_disabled = ['sh']
" vim-rainbow
let g:rainbow_active = 1
" vimspector
let g:vimspector_enable_mappings = 'VISUAL_STUDIO'
" coc
let g:coc_global_extensions = [
    \ 'coc-clangd',
    \ 'coc-cmake',
    \ 'coc-explorer',
    \ 'coc-git',
    \ 'coc-json',
    \ 'coc-lists',
    \ 'coc-markdownlint',
    \ 'coc-pyright',
    \ 'coc-python',
    \ 'coc-sh',
    \ 'coc-toml',
    \ 'coc-tsserver',
    \ 'coc-vimlsp',
    \ 'coc-xml',
    \ 'coc-yaml'
\ ]
" vimspector
let g:vimspector_install_gadgets = [
    \ 'debugpy',
    \ 'vscode-cpptools'
\ ]

set runtimepath+=/home/coma/.cache/dein/repos/github.com/Shougo/dein.vim
if dein#load_state('/home/coma/.cache/dein')
    call dein#begin('/home/coma/.cache/dein')
    call dein#add('/home/coma/.cache/dein/repos/github.com/Shougo/dein.vim')

    call dein#add('/home/coma/.fzf')
    call dein#add('cohama/lexima.vim')
    call dein#add('chrisbra/Colorizer')
    call dein#add('frazrepo/vim-rainbow')
    call dein#add('junegunn/fzf.vim')
    call dein#add('neoclide/coc.nvim/', { 'rev': 'release' })
    call dein#add('preservim/tagbar')
    call dein#add('puremourning/vimspector')
    call dein#add('rhysd/clever-f.vim')
    call dein#add('sheerun/vim-polyglot')
    call dein#add('simnalamburt/vim-mundo')
    call dein#add('tpope/vim-commentary')
    call dein#add('tpope/vim-dispatch')
    call dein#add('tpope/vim-fugitive')
    call dein#add('tpope/vim-sensible')
    call dein#add('tpope/vim-surround')
    call dein#add('vim-airline/vim-airline')
    call dein#add('KeitaNakamura/neodark.vim')
    call dein#add('ghifarit53/tokyonight-vim')

    call dein#end()
    call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

" Theme
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='neodark'

let g:tokyonight_style = 'night'
let g:tokyonight_enable_italic = 1
colorscheme tokyonight

highlight ColorColumn ctermbg=grey guibg=grey

" Nvim Settings
set clipboard^=unnamedplus
set cmdheight=2
set colorcolumn=100
set completeopt-=preview
set expandtab
set foldmethod=indent
set hidden
set hlsearch
set ignorecase
set lcs=eol:¬,space:·,tab:――⇀
set list
set ls=2
set nobackup
set nocompatible
set nofoldenable
set nowrap
set nowritebackup
set number
set relativenumber
set scrolloff=0
set shiftwidth=4
set shortmess+=c
set smartcase
set smartindent
set smarttab
set softtabstop=4
set tabstop=4
set undodir=~/.cache/vim/undodir
set undofile
set updatetime=4000 "50
set wildmode=list:longest

if has("patch-8.1.1564")
  set signcolumn=number
else
  set signcolumn=yes
endif

filetype plugin indent on
syntax enable

" Bindings
let mapleader = " "

" Quick open
nnoremap <leader>oh :vert help<space>
nnoremap <leader>oe :edit<space>
nnoremap <silent> <leader>on :cnext<cr>
nnoremap <silent> <leader>op :cprevious<cr>
nnoremap <leader>ot :tabe<space>
nnoremap <silent> <leader>ov :edit ~/.config/nvim/init.vim<cr>
nnoremap <silent> <leader>oc q:
nnoremap <silent> <leader>os q/
nnoremap <silent> <leader>ob q?

" Editing<silent>
nnoremap <silent> - :pu _<cr>
nnoremap <silent> Y y$
nnoremap <silent> _ :pu! _<cr>
nnoremap <silent> <leader><cr> :w<CR>

" Panes
nnoremap <silent> <leader>tc :tabclose<cr>
nnoremap <silent> <leader>tp :tabp<cr>
nnoremap <silent> <leader>tn :tabn<cr>
nnoremap <silent> <leader>tt :wincmd T<cr>
nnoremap <leader>th :tab help<space>
nnoremap <silent> <leader>tv :tabe ~/.config/nvim/init.vim<cr>

" Windows<silent>
nnoremap <silent> <leader>h :wincmd h<cr>
nnoremap <silent> <leader>j :wincmd j<cr>
nnoremap <silent> <leader>k :wincmd k<cr>
nnoremap <silent> <leader>l :wincmd l<cr>
nnoremap <silent> <leader>H :wincmd H<cr>
nnoremap <silent> <leader>L :wincmd L<cr>
nnoremap <silent> <leader>v :wincmd v<cr>
nnoremap <silent> <leader>s :wincmd s<cr>
nnoremap <silent> <Leader>* :resize +10<cr>
nnoremap <silent> <Leader>_ :resize -10<cr>
nnoremap <silent> <Leader>+ :vertical resize +10<cr>
nnoremap <silent> <Leader>- :vertical resize -10<cr>
nnoremap <silent> <leader>x :wincmd q<cr>
nnoremap <silent> <leader>y :only<cr>

" Bars
nnoremap <silent> <leader>bm :MundoToggle<cr>
nnoremap <silent> <leader>bt :TagbarToggle<cr>

" Debugging
nmap <leader>dc <Plug>VimspectorContinue
nmap <leader>ds <Plug>VimspectorStop
nmap <leader>dr <Plug>VimspectorRestart
nmap <leader>dp <Plug>VimspectorPause
nmap <leader>db <Plug>VimspectorToggleBreakpoint
nmap <leader>dd <Plug>VimspectorToggleConditionalBreakpoint
nmap <leader>df <Plug>VimspectorAddFunctionBreakpoint
nmap <C-n> <Plug>VimspectorStepOver
nmap <C-M-n> <Plug>VimspectorStepInto
nmap <C-N> <Plug>VimspectorStepOut
nmap <leader>dh <Plug>VimspectorRunToCursor
nnoremap <leader>de :VimspectorEval<space>
nnoremap <leader>dw :VimspectorWatch<space>

" Git
nnoremap <silent> <leader>ga :GFiles?<cr>
nnoremap <silent> <leader>gb :BCommits<cr>
nnoremap <silent> <leader>gc :Commits<cr>
nnoremap <silent> <leader>gd :Git difftool<cr>
nnoremap <leader>ge :Git grep<space>
nnoremap <silent> <leader>gf :GFiles<cr>
nnoremap <silent> <leader>gg :Git<cr>
nnoremap <silent> <leader>gi :CocCommand git.chunkInfo<cr>
nnoremap <silent> <leader>gl :Git blame<cr>
nnoremap <leader>gn :GRename<space>
nnoremap <silent> <leader>gp :CocCommand git.push<cr>
nnoremap <silent> <leader>gr :Gread<cr>
nnoremap <silent> <leader>gs :CocCommand git.chunkStage<cr>
nnoremap <silent> <leader>gu :CocCommand git.chunkUndo<cr>
nnoremap <silent> <leader>gw :Gwrite<cr>
nnoremap <silent> <leader>gy :CocCommand git.copyUrl<cr>
vnoremap <silent> <leader>gl :Git blame<cr>

" FZF
nnoremap <silent> <leader>fb :Buffers<cr>
nnoremap <silent> <leader>fc :Commands<cr>
nnoremap <silent> <leader>ff :Files<cr>
nnoremap <leader>fg :Rg<space>
nnoremap <silent> <leader>fh :Helptags<cr>
nnoremap <silent> <leader>fh :History<cr>
nnoremap <silent> <leader>fi :Windows<cr>
nnoremap <silent> <leader>fl :Lines<cr>
nnoremap <silent> <leader>fm :Maps<cr>
nnoremap <silent> <leader>fr :History:<cr>
nnoremap <silent> <leader>fs :History/<cr>
nnoremap <silent> <leader>ft :Colors<cr>
nnoremap <silent> <leader>fw :Rg <C-R>=expand("<cword>")<cr><CR>
nnoremap <silent> <leader>fy :Filetypes<cr>

" Misc
nnoremap <silent> <leader>nh :noh<cr>:call clever_f#reset()<CR>
nnoremap <silent> <leader>ns :source %<cr>

" COC Bindings
nnoremap <leader>prw :CocSearch <C-R>=expand("<cword>")<cr><CR>
inoremap <silent><expr> <C-space> coc#refresh()
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call <SID>show_documentation()<cr>
nmap <leader>crn <Plug>(coc-rename)
xmap <leader>cf  <Plug>(coc-format-selected)
nmap <leader>cf  <Plug>(coc-format-selected)
nnoremap <leader>cfb :Format<cr>
xmap <leader>ca  <Plug>(coc-codeaction-selected)
nmap <leader>ca  <Plug>(coc-codeaction-selected)
nmap <leader>cab  <Plug>(coc-codeaction)
nmap <leader>cqf  <Plug>(coc-fix-current)
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)
nnoremap <silent><nowait> <leader>CA  :<C-u>CocList diagnostics<cr>
nnoremap <silent><nowait> <leader>CE  :<C-u>CocList extensions<cr>
nnoremap <silent><nowait> <leader>CC  :<C-u>CocList commands<cr>
nnoremap <silent><nowait> <leader>CO  :<C-u>CocList outline<cr>
nnoremap <silent><nowait> <leader>CS  :<C-u>CocList -I symbols<cr>
nnoremap <silent><nowait> <leader>CJ  :<C-u>CocNext<cr>
nnoremap <silent><nowait> <leader>CK  :<C-u>CocPrev<cr>
nnoremap <silent><nowait> <leader>CP  :<C-u>CocListResume<cr>
nnoremap <silent><leader>e :CocCommand explorer --sources=file+<cr>
nnoremap <silent> <leader>E <cmd>call g:CocExplorerAtCurBuf()<cr>

" .fish files highlighting
autocmd BufReadPost *.html syntax on

function! g:CocExplorerAtCurBuf() abort
    let cur_buf_dir = expand('%:h')
    exec 'CocCommand explorer --sources=file+ ' . cur_buf_dir
endfunction

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <cr>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<cr>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<cr>"
endif

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

augroup coc
  autocmd!
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

command! -nargs=0 Format :call CocAction('format')
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

augroup clangd
    autocmd FileType cpp nnoremap <buffer><silent><nowait> <leader>ch :<C-u>CocCommand clangd.switchSourceHeader<cr>
    autocmd FileType cpp nnoremap <buffer><silent><nowait> <leader>cl :<C-u>CocCommand clangd.symbolInfo<cr>
augroup end

" cool stuff:
" ^W-t ^W-H align windows vertically
" gp: paste and set the cursor right behind the paste
" t -> before, f -> right at it, a -> after
