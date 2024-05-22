function loadGitPlugin()
    print("Git plugins loaded")
end

vim.api.nvim_command("autocmd User GitDir lua loadGitPlugin()")

if vim.g.gitdir then 
  vim.api.nvim_command_output("doautocmd User GitDir")
end
