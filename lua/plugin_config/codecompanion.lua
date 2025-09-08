require("codecompanion").setup({
    display = {
        chat = {
            show_settings = true,
        }
    },
    strategies = {
        chat = {
            adapter = "openai",
        },
        inline = {
            adapter = "openai",
        },
        cmd = {
            adapter = "openai",
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
        end,
        gemini = function()
            return require("codecompanion.adapters").extend("gemini", {
                env = {
                    api_key = vim.env.GEMINI_API_KEY,
                },
                schema = {
                    model = {
                        default = "gemini-2.5-pro"
                    }
                }
            })
        end
    },
})

vim.keymap.set("n", "<leader>a", ":CodeCompanionChat Toggle<CR>", { desc = "Open AI Chat" })
vim.keymap.set("v", "<leader>a", ":CodeCompanion<CR>", { desc = "Open AI Chat" })
