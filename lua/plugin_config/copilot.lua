
vim.defer_fn(function()
    local copilot = require("copilot")

    local isEnvFile = function()
        if string.match(vim.fs.basename(vim.api.nvim_buf_get_name(0)), '.env') then
            -- disable for .env files
            return true
        end
        return false
    end

    if isEnvFile() then
        -- disable copilot
        vim.cmd[[Copilot disable]]
    end

    copilot.setup{
        suggestion = { enabled = true },
        panel = { enabled = true },
        filetypes = {
            conf = false,
            yaml = false,
            markdown = false,
            help = false,
            gitcommit = false,
            gitrebase = false,
            hgcommit = false,
            svn = false,
            cvs = false,
            sh = false,
            text = false,
            ["."] = false,
        },
    }
end, 10)

