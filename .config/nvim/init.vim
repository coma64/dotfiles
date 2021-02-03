" dein
if &compatible
    set nocompatible               " Be iMproved
endif

" Plugin settings
" fzf
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'
let g:fzf_checkout_track_key = 'ctrl-t'

" vim-session
let g:session_autosave = 'no'

" polyglot
let g:polyglot_disabled = ['sh']

" vim-localvimrc
let g:localvimrc_ask = 0
let g:localvimrc_name = ['.lvimrc', '.vim/vimrc.vvimspectorim']
let g:localvimrc_sandbox = 0

" vimspector
let g:vimspector_enable_mappings = 'VISUAL_STUDIO'

" vim-rainbow
let g:rainbow_active = 1

" Required:
set runtimepath+=/home/coma/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/home/coma/.cache/dein')
  call dein#begin('/home/coma/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/home/coma/.cache/dein/repos/github.com/Shougo/dein.vim')

    call dein#add('/home/coma/.fzf')
    call dein#add('AndrewRadev/bufferize.vim')
    call dein#add('chrisbra/Colorizer')
    call dein#add('christoomey/vim-conflicted')
    call dein#add('cohama/lexima.vim')
    call dein#add('embear/vim-localvimrc')
    call dein#add('frazrepo/vim-rainbow')
    call dein#add('junegunn/fzf.vim')
    call dein#add('mg979/vim-studio-dark')
    call dein#add('mhinz/vim-startify')
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
    call dein#add('vim-airline/vim-airline-themes')
    call dein#add('vimlab/split-term.vim')
    call dein#add('wsdjeg/dein-ui.vim')
    call dein#add('xolox/vim-misc')
    call dein#add('xolox/vim-session')

    " Required:
    call dein#end()
    call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

" Sensible defaults ^^
set clipboard^=unnamedplus              
set undodir=~/.cache/vim/undodir
set undofile
set completeopt-=preview
set number                              
set relativenumber                      
set nocompatible
set expandtab
set tabstop=4
set softtabstop=4
set smarttab
set shiftwidth=4
set ls=2                                
set scrolloff=0                         
set ignorecase
set smartcase
set hlsearch                            
set nowrap
set wildmode=list:longest
set smartindent
set colorcolumn=100
highlight ColorColumn ctermbg=grey guibg=grey
set foldmethod=indent
set nofoldenable
set lcs=eol:¬,space:·,tab:――⇀
set list

" Bindings
let mapleader = " "
nnoremap Y y$
nnoremap <C-n> :noh<CR>:call clever_f#reset()<CR>
nnoremap - :pu _<CR>
nnoremap _ :pu! _<CR>
nnoremap <leader><CR> :so %<CR>
nnoremap <leader>R :tabe ~/.config/nvim/init.vim<CR>
nnoremap <leader>te :tabe<SPACE>
nnoremap <leader>th :tab help<SPACE>

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

nnoremap <leader>H :wincmd H<CR>
nnoremap <leader>J :wincmd J<CR>
nnoremap <leader>K :wincmd K<CR>
nnoremap <leader>L :wincmd L<CR>

nnoremap <leader>v :wincmd v<CR>
nnoremap <leader>s :wincmd s<CR>
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>

nnoremap <leader>T :wincmd T<CR>
nnoremap <leader>x :wincmd q<CR>
nnoremap <leader>X :q!<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>o :only<CR>

nnoremap <leader>nn :next<CR>
nnoremap <leader>np :previous<CR>
nnoremap <leader>qo :copen<CR>
nnoremap <leader>qn :cnext<CR>
nnoremap <leader>qp :cprev<CR>
"nnoremap <leader>lq :lopen<CR>
"nnoremap <leader>ln :lnext<CR>
"nnoremap <leader>lp :lprev<CR>

nnoremap <BS> za
nnoremap <C-BS> zA
nnoremap <C-h> zA
" ctrl backspace doesn't work in tty

" Plugin mappings
nnoremap <leader>bm :MundoToggle<CR>
nnoremap <leader>bt :TagbarToggle<CR>

nnoremap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>

nnoremap <leader>Ss :SaveSession<SPACE>
nnoremap <leader>So :OpenSession<SPACE>

nnoremap <leader>D :Dispatch<CR>

nnoremap <leader>dfg :diffget<CR>
nnoremap <leader>dfp :diffput<CR>

nnoremap <leader>dtc :call vimspector#RunToCursor()<CR>

nnoremap <leader>fff :Files<CR>
nnoremap <leader>ffg :GFiles<CR>
nnoremap <leader>ffl :Locate<SPACE>
nnoremap <leader>fw :Rg <C-R>=expand("<cword>")<CR><CR>
nnoremap <Leader>fr :Rg<SPACE>
nnoremap <leader>fb  :Buffers<CR>
nnoremap <leader>fla :Lines<CR>
nnoremap <leader>flb :BLines<CR>
nnoremap <leader>fta :Tags<CR>
nnoremap <leader>ftb :BTags<CR>
nnoremap <leader>fi :Windows<CR>
nnoremap <leader>fhf :History<CR>
nnoremap <leader>fhc :History:<CR>
nnoremap <leader>fhs :History/<CR>
nnoremap <leader>fga :Commits<CR>
nnoremap <leader>fgb :BCommits<CR>
nnoremap <leader>fc :Commands<CR>
nnoremap <leader>fm :Maps<CR>
nnoremap <leader>fh :Helptags<CR>
nnoremap <leader>fy :Filetypes<CR>

" COC Bindings
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use space space to trigger completion.
inoremap <silent><expr> <C-space> coc#refresh()

" Some default idk
imap <C-s> <Plug>(coc-snippets-expand-jump)

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Symbol renaming.
nmap <leader>crn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>cf  <Plug>(coc-format-selected)
nmap <leader>cf  <Plug>(coc-format-selected)
" Format buffer
nnoremap <leader>cfb :Format<CR>

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>ca  <Plug>(coc-codeaction-selected)
nmap <leader>ca  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>cab  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>cqf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <leader>CA  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <leader>CE  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <leader>CC  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <leader>CO  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <leader>CS  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <leader>CJ  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <leader>CK  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <leader>CP  :<C-u>CocListResume<CR>

" Commands
" Overwrite :W to also save the file cuz i keep typing it by accident...
command! -nargs=0 W :w

" Explorer
nmap <leader>e :CocCommand explorer<CR>
"nnoremap <leader>e :Lex<Cr>:vert resize 40<Cr>

" Enable true color 24
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" Theme
set background=dark
let g:Vsd = {}
let g:Vsd.contrast = 2  " low medium (default) high
colorscheme tomorrow_eighties

" Airline 
let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#enabled = 1
" let g:airline_theme = 'miramare'
let g:airline_theme='wombat'


" .fish files highlighting
autocmd BufReadPost *.fish set syntax=fish

"""""""""""" COC """""""""""" 
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
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

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" extension specific bindings
" reuse <leader>{h,l,u,i}
" coc-clangd
augroup clangd
    autocmd FileType cpp nnoremap <buffer><silent><nowait> <leader>ch :<C-u>CocCommand clangd.switchSourceHeader<CR>
    autocmd FileType cpp nnoremap <buffer><silent><nowait> <leader>cl :<C-u>CocCommand clangd.symbolInfo<CR>
augroup end

" COOLSTUFF:
" ^W-t ^W-H align windows vertically
" gp: paste and set the cursor right behind the paste
" t -> before, f -> right at it, a -> after
