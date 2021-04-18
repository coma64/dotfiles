local function show_documentation()
    if vim.fn.index({ 'vim', 'help' }, vim.bo.filetype) >= 0 then
        vim.api.nvim_command('help ' .. vim.fn.expand('<cword>'))
    else
        vim.fn.CocAction('doHover')
    end
end

local function coc_explorer_at_current_buffer()
    local dir = vim.fn.expand('%:h')
    vim.api.nvim_command('CocCommand explorer --sources=file+ ' .. dir)
end

local function create_augroup(name, autocmds)
    vim.api.nvim_command('augroup ' .. name)
    vim.api.nvim_command('autocmd!')

    for _, autocmd in ipairs(autocmds) do
        vim.api.nvim_command('autocmd ' .. autocmd.event .. ' ' .. autocmd.pattern .. ' ' .. autocmd.command)
    end

    vim.api.nvim_command('augroup end')
end

local function reload_config()
    local path = vim.fn.stdpath('config') .. '/init.lua'
    dofile(path)
end

return {
    show_documentation = show_documentation,
    coc_explorer_at_current_buffer = coc_explorer_at_current_buffer,
    create_augroup = create_augroup,
    reload_config = reload_config
}
