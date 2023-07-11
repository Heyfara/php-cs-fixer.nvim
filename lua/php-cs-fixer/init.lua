local M = {}

M.fix = function (path, dryRun)
    local command = 'php-cs-fixer fix ' .. path

    if dryRun == true then
        command = command .. ' --dry-run'
    end

    local out = vim.fn.system(command)
    print(out)
end

return M
