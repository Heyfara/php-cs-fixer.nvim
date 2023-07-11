local M = {
    default_options = {
        php_cs_fixer_path = nil,
        rules = '@PSR12',
        verbose = nil,
        dry_run = false,
        quiet = false,
        allow_risky = false,
        format = 'txt',
        path_mode = nil,
        diff = false,
        stop_on_violation = false,
    }
}

M.options = M.default_options

local function buildCommand(path)
    local command = M.options.php_cs_fixer_path

    if M.options.php_cs_fixer_path == nil then
        command = 'php-cs-fixer'
    end

    command = command .. ' fix ' .. path
    command = command .. ' --rules=' .. M.options.rules

    if M.options.verbose then
        command = command .. ' --verbose=' .. M.options.verbose
    end

    if M.options.dry_run then
        command = command .. ' --dry-run'
    end

    if M.options.quiet then
        command = command .. ' --quiet'
    end

    if M.options.allow_risky then
        command = command .. ' --allow-risky=yes'
    end

    if M.options.format then
        command = command .. ' --format=' .. M.options.format
    end

    if M.options.path_mode then
        command = command .. ' --path-mode=' .. M.options.path_mode
    end

    if M.options.diff then
        command = command .. ' --diff'
    end

    if M.options.stop_on_violation then
        command = command .. ' --stop-on-violation'
    end

    return command
end

function M.setup(user_options)
    user_options = user_options or {}
    M.options = vim.tbl_deep_extend("keep", user_options, M.default_options)
end

function M.fix(path)
    local command = buildCommand(path)

    local out = vim.fn.system(command)
    print(out)
end

return M
