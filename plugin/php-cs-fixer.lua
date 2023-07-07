local api = vim.api

api.nvim_create_user_command("FixFile", function(o)
    require("php-cs-fixer").fixFile('', true)
end, {})
