require("codecompanion").setup({
    display = {
        chat = {
            show_settings = true,
        }
    },
    strategies = {
        chat = {
            adapter = "anthropic",
        },
        inline = {
            adapter = "anthropic",
        },
        cmd = {
            adapter = "anthropic",
        }
    },
    adapters = {
        anthropic = function()
            return require("codecompanion.adapters").extend("anthropic", {
                env = {
                    api_key = vim.env.ANTHROPIC_API_KEY,
                },
                schema = {
                    model = {
                        default = "claude-opus-4-20250514"
                    }
                }
            })
        end,
        openai = function()
            return require("codecompanion.adapters").extend("openai", {
                env = {
                    api_key = vim.env.OPENAI_API_KEY,
                },
            })
        end
    },
})

vim.keymap.set("n", "<leader>a", ":CodeCompanionChat Toggle<CR>", { desc = "Open AI Chat" })
