local api = vim.api

api.nvim_create_user_command("FixFile", function()
    require("php-cs-fixer").fix(vim.fn.expand('%:p'))
end, {})

api.nvim_create_user_command("FixDirectory", function()
    require("php-cs-fixer").fix(vim.fn.expand('%:p:h'))
end, {})
