local M = {}

M.fixFile = function (path, dryRun)
    local command = 'php-cs-fixer fix ' .. path

    if dryRun == true then
        command = command .. '--dry-run'
    end

    local status = os.execute(command)
    print(status)
end

M.fixDirectory = function (path, dryRun)
end

return M
