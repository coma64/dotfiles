local N = 'n'
local I = 'i'
local V = 'v' -- Visual or select mode
local X = 'x' -- Visual mode only
local O = 'o' -- Operator pending
local L = '<leader>'

local function map(key, command, mode, options)
    mode = mode or N

    options = options or {}
    if options.noremap == nil then options.noremap = true end
    if options.silent == nil then options.silent = true end

    vim.api.nvim_set_keymap(mode, key, command, options)
end

vim.g.mapleader = ' '

-- Neovim
map(L .. 'r', ":lua require('utils').reload_config()<cr>")

-- Quick open
map(L .. 'o', ':cnext<cr>')
map(L .. 'O', ':cprevious<cr>')

-- Editing
map('-', ':pu _<cr>')
map('Y', 'y$')
map('_', ':pu! _<cr>')

-- Tabs
map(L .. 't', ':tabn<cr>')
map(L .. 'T', ':tabp<cr>')

-- Windows
map(L .. '*', ':resize +20<cr>')
map(L .. '+', ':vertical resize +20<cr>')
map(L .. '-', ':vertical resize -20<cr>')
map(L .. '_', ':resize -20<cr>')
map(L .. 'H', ':wincmd H<cr>')
map(L .. 'L', ':wincmd L<cr>')
map('H', ':wincmd h<cr>')
map(L .. 'j', ':wincmd j<cr>')
map(L .. 'k', ':wincmd k<cr>')
map('L', ':wincmd l<cr>')
map(L .. 's', ':wincmd s<cr>')
map(L .. 'v', ':wincmd v<cr>')
map(L .. 'x', ':wincmd q<cr>')
map(L .. 'y', ':only<cr>')
map(L .. 'wt', ':wincmd T<cr>')

-- Bars
map(L .. 'b', ':MundoToggle<cr>')

-- Debugging
-- Should they be non silent and non noremap?
map('<C-M-n>', '<Plug>VimspectorStepInto')
map('<C-N>', '<Plug>VimspectorStepOut')
map('<C-n>', '<Plug>VimspectorStepOver')
map(L .. 'db', '<Plug>VimspectorToggleBreakpoint')
map(L .. 'dc', '<Plug>VimspectorContinue')
map(L .. 'dd', '<Plug>VimspectorToggleConditionalBreakpoint')
map(L .. 'de', ':VimspectorEval<space>')
map(L .. 'df', '<Plug>VimspectorAddFunctionBreakpoint')
map(L .. 'dh', '<Plug>VimspectorRunToCursor')
map(L .. 'dp', '<Plug>VimspectorPause')
map(L .. 'dr', '<Plug>VimspectorRestart')
map(L .. 'ds', '<Plug>VimspectorStop')
map(L .. 'dw', ':VimspectorWatch<space>')

-- Git
map(L .. 'ga', ':GFiles?<cr>')
map(L .. 'gb', ':BCommits<cr>')
map(L .. 'gc', ':Commits<cr>')
map(L .. 'gd', ':Git difftool<cr>')
map(L .. 'ge', ':Git grep<space>', N, { silent = false })
map(L .. 'gf', ':GFiles<cr>')
map(L .. 'gg', ':vert Git<cr>')
map(L .. 'gi', ':CocCommand git.chunkInfo<cr>')
map(L .. 'gl', ':Git blame<cr>')
map(L .. 'gl', ':Git blame<cr>', V)
map(L .. 'gp', ':CocCommand git.push<cr>')
map(L .. 'gr', ':Gread<cr>')
map(L .. 'gs', ':CocCommand git.chunkStage<cr>')
map(L .. 'gu', ':CocCommand git.chunkUndo<cr>')
map(L .. 'gw', ':Gwrite<cr>')
map(L .. 'gy', ':CocCommand git.copyUrl<cr>')

-- FZF
map(L .. 'ff', ':Files<cr>')
map(L .. 'fg', ':Rg<space>', N, { silent = false })
map(L .. 'fh', ':History<cr>')
map(L .. 'fc', ':History:<cr>')
map(L .. 'fl', ':Lines<cr>')
map(L .. 'fm', ':Maps<cr>')
map(L .. 'fw', ':Rg <C-R>=expand("<cword>")<cr><CR>')

-- COC
map('<C-s>', '<Plug>(coc-range-select)', N, { noremap = false })
map('<C-s>', '<Plug>(coc-range-select)', X, { noremap = false })
map('<C-space>', 'coc#refresh()', I, { expr = true })

map('K', [[:lua require('utils').show_documentation()<cr>]])

map('gn', '<Plug>(coc-diagnostic-prev)', N, { noremap = false })
map('gs', '<Plug>(coc-diagnostic-next)', N, { noremap = false })

map('ac', '<Plug>(coc-classobj-a)', O, { noremap = false })
map('ac', '<Plug>(coc-classobj-a)', X, { noremap = false })
map('af', '<Plug>(coc-funcobj-a)', O, { noremap = false })
map('af', '<Plug>(coc-funcobj-a)', X, { noremap = false })
map('ic', '<Plug>(coc-classobj-i)', O, { noremap = false })
map('ic', '<Plug>(coc-classobj-i)', X, { noremap = false })
map('if', '<Plug>(coc-funcobj-i)', O, { noremap = false })
map('if', '<Plug>(coc-funcobj-i)', X, { noremap = false })

map('gd', '<Plug>(coc-definition)', N, { noremap = false })
map('gi', '<Plug>(coc-implementation)', N, { noremap = false })
map('gy', '<Plug>(coc-type-definition)', N, { noremap = false })
map('gr', '<Plug>(coc-references)', N, { noremap = false })

map(L .. 'CA', ':<C-u>CocList diagnostics<cr>', N, { nowait = true })
map(L .. 'CC', ':<C-u>CocList commands<cr>', N, { nowait = true })
map(L .. 'CE', ':<C-u>CocList extensions<cr>', N, { nowait = true })
map(L .. 'CO', ':<C-u>CocList outline<cr>', N, { nowait = true })
map(L .. 'CP', ':<C-u>CocListResume<cr>', N, { nowait = true })
map(L .. 'CJ', ':<C-u>CocNext<cr>', N, { nowait = true })
map(L .. 'CK', ':<C-u>CocPrev<cr>', N, { nowait = true })
map(L .. 'CS', ':<C-u>CocList -I symbols<cr>', N, { nowait = true })


map(L .. 'ca' , '<Plug>(coc-codeaction-selected)', N, { silent = false })
map(L .. 'ca', '<Plug>(coc-codeaction-selected)', X)
map(L .. 'cab', '<Plug>(coc-codeaction)', N, { silent = false })
map(L .. 'cf' , '<Plug>(coc-format-selected)', N, { silent = false })
map(L .. 'cf', '<Plug>(coc-format-selected)', X)
map(L .. 'cfb', ':Format<cr>')
map(L .. 'cqf', '<Plug>(coc-fix-current)', N, { silent = false })
map(L .. 'crn', '<Plug>(coc-rename)', N, { silent = false })

map(L .. 'e', ':CocCommand explorer --sources=file+<cr>')
map(L .. 'E', [[:lua require('utils').coc_explorer_at_current_buffer()<cr>]])

if vim.fn.exists('*complete_info') then
    map('<cr>', [[complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<cr>"]], I, { expr = true })
else
    map('<cr>', [[pumvisible() ? "\<C-y>" : "\<C-g>u\<cr>"]], I, { expr = true })
end

return {
    map = map
}
