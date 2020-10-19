" dein
if &compatible
    set nocompatible               " Be iMproved
endif


" Required:
set runtimepath+=/home/coma/.local/share/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/home/coma/.local/share/dein')
    call dein#begin('/home/coma/.local/share/dein')

    " Let dein manage dein
    " Required:
    call dein#add('/home/coma/.local/share/dein/repos/github.com/Shougo/dein.vim')

    " Add or remove your plugins here like this:
    call dein#add('vim-airline/vim-airline')
    call dein#add('tpope/vim-sensible')
    call dein#add('chrisbra/Colorizer')
    call dein#add('neoclide/coc.nvim/', { 'rev': 'release' })
    call dein#add('tpope/vim-fugitive')
    call dein#add('tpope/vim-dispatch')
    call dein#add('sheerun/vim-polyglot')
    call dein#add('junegunn/fzf', { 'build': './install', 'rtp': '' })
    call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })
    call dein#add('tpope/vim-surround')
    call dein#add('rhysd/clever-f.vim')
    call dein#add('franbach/miramare')
    call dein#add('balanceiskey/vim-framer-syntax')
    call dein#add('simnalamburt/vim-mundo')
    call dein#add('mhinz/vim-startify')

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
highlight ColorColumn ctermbg=0 guibg=grey

" Bindings
let mapleader = " "
nnoremap Y y$
nnoremap <C-n> :noh<CR>:call clever_f#reset()<CR>
nnoremap <leader>t :tabe<SPACE>
nnoremap - :pu _<CR>
nnoremap _ :pu! _<CR>
nnoremap <leader><CR> :so %<CR>
nnoremap <leader>r :tabe ~/.config/nvim/init.vim<CR>
nnoremap <leader>m :MundoToggle<CR>
nnoremap <leader>pw :Rg <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>
nnoremap <Leader>ps :Rg<SPACE>
nnoremap <leader>pf :Files<CR>
nnoremap <C-p> :GFiles<CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>H :wincmd H<CR>
nnoremap <leader>J :wincmd J<CR>
nnoremap <leader>K :wincmd K<CR>
nnoremap <leader>L :wincmd L<CR>
nnoremap <leader>o :only<CR>
nnoremap <leader>v :wincmd v<CR>
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
nnoremap <leader>qa :qa<CR>
nnoremap <leader>qq :qa!<CR>
nnoremap <leader>wa :wqa<CR>
nnoremap <leader>ww :wqa!<CR>
nnoremap <leader>n :next<CR>
nnoremap <leader>N :previous<CR>
" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)
nnoremap H F(
nnoremap L f(

" fzf
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'
let g:fzf_checkout_track_key = 'ctrl-t'

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
let g:miramare_enable_italic = 1
colorscheme miramare

" Airline 
let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'miramare'

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

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use space space to trigger completion.
inoremap <silent><expr> <C-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

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

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

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

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <leader>A  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <leader>E  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <leader>C  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <leader>O  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <leader>S  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <leader>J  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <leader>K  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <leader>P  :<C-u>CocListResume<CR>

" extension specific bindings
" reuse <leader>{h,l,u,i}
" coc-clangd
augroup clangd
    autocmd FileType cpp nnoremap <buffer><silent><nowait> <leader>h :<C-u>CocCommand clangd.switchSourceHeader<CR>
    autocmd FileType cpp nnoremap <buffer><silent><nowait> <leader>l :<C-u>CocCommand clangd.symbolInfo<CR>
augroup end

" COOLSTUFF:
" ^W-t ^W-H align windows vertically
" gp: paste and set the cursor right behind the paste
" :close or ^W-c to hide the close the window
" ^W-o close all other windows
" ^W-s and ^W-v to split the window horizontally and vertically
" starting vim with -o or -O will open each file in its own window
" :sb open buffer in new window
" ^++ go to symbol under cursor i think
" :wqa close all and everything
" gv: go to previous selection
" using A and I and visual block mode
" :so % reload init.vim (actually source current file)
" g ^G to show file info
" usr_27.txt
" ^+ go to definition
" Read netrw doc start

