local success, project_settings = pcall(require, 'project-settings')
if not success then return end

project_settings.setup({
  allow = {
    venv = function (path)
      vim.g.python3_host_prog = path
    end
  },
})
