local api = vim.api

api.nvim_create_user_command("FixFile", function(o)
    require("php-cs-fixer").fix(vim.fn.expand('%:p'), true)
end, {})

api.nvim_create_user_command("FixDirectory", function(o)
    require("php-cs-fixer").fix(vim.fn.expand('%:p:h'), true)
end, {})
