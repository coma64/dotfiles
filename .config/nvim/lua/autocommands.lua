local utils = require 'utils'

utils.create_augroup(
    'zsh',
    {
        {
            event = 'BufReadPost', pattern = '*.zsh', command = 'setlocal norelativenumber'
        },
        {
            event = 'BufReadPost', pattern = '.zshrc', command = 'setlocal norelativenumber'
        },
        {
            event = 'BufReadPost', pattern = '.zshenv', command = 'setlocal norelativenumber'
        },
        {
            event = 'BufReadPost', pattern = '.zprofile', command = 'setlocal norelativenumber'
        }
    }
)

utils.create_augroup(
    'coc',
    {
        {
            event = 'FileType', pattern = 'typescript,json', command = "setlocal formatexpr=CocAction('formatSelected')"
        },
        {
            event = 'User', pattern = 'CocJumpPlaceholder', command = "call CocActionAsync('showSignatureHelp')"
        },
        {
            event = 'CursorHold', pattern = '*', command = "silent call CocActionAsync('highlight')"
        }
    }
)

utils.create_augroup(
    'clangd',
    {
        {
            event = 'FileType', pattern = 'cpp', command = 'nnoremap <buffer><silent><nowait> <leader>ch :<C-u>CocCommand clangd.switchSourceHeader<cr>'
        },
        {
            event = 'FileType', pattern = 'cpp', command = 'nnoremap <buffer><silent><nowait> <leader>cl :<C-u>CocCommand clangd.symbolInfo<cr>'
        }
    }
)
