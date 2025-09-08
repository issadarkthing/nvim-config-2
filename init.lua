
-- package manager
vim.cmd[[packadd packer.nvim]]

require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

    -- add additional treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

	-- lsp installer
	use {
		"williamboman/mason-lspconfig.nvim",
		requires = {"neovim/nvim-lspconfig", "williamboman/mason.nvim"},
		config = function() 
			require("plugin_config.mason")
		end
	}

	-- theme
    use { 'Mofiqul/vscode.nvim' }

	-- auto completion
	-- use {
	-- 	'ms-jpq/coq_nvim',
	-- 	branch = 'coq',
	-- }

    -- copilot
    use {
        "zbirenbaum/copilot.lua",
        config = function()
            require("plugin_config.copilot")
        end
    }

    use "onsails/lspkind.nvim"

    use {
        "zbirenbaum/copilot-cmp",
        after = { "copilot.lua" },
        config = function()
            require("copilot_cmp").setup()
        end
    }

    use {
        'hrsh7th/nvim-cmp',
        requires = {
            'neovim/nvim-lspconfig',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-path'
        },
        config = function()
            require("plugin_config.nvim-cmp")
        end
    }

    -- surround stuff based on filetype
    use 'tpope/vim-surround'

    -- finder
    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} },
        config = function()
            require('plugin_config.telescope')
        end
    }

    -- add helper commands such as :Delete
    use 'tpope/vim-eunuch'

    -- git client
    use { 
	    'kdheepak/lazygit.nvim',
	    config = function() 
		    require('plugin_config.lazygit')
	    end
    }

    -- auto pair
    use {
        'windwp/nvim-autopairs',
        config = function() 
            require("plugin_config.nvim-autopairs")
        end
    }

    -- typescript/javascript formatter
    use { 
        'issadarkthing/vim-prettier', 
        opt = true, ft = {'typescript', 'typescriptreact'},
        run = {'yarn install'},
    }

    -- html tag completion
    use 'tpope/vim-ragtag'

    -- note taking
    use 'vimwiki/vimwiki'

    -- better typescript lsp
    use {
        "pmizio/typescript-tools.nvim",
        requires = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    }

    -- typescript checker
    use { "issadarkthing/tsc.nvim" }

    -- status line
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    -- ai plugin
    use {
        "olimorris/codecompanion.nvim",
        config = function()
            require("plugin_config.codecompanion")
        end,
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            "hrsh7th/nvim-cmp", -- Optional: For using slash commands and variables in the chat buffer
            "nvim-telescope/telescope.nvim", -- Optional: For using slash commands
            "stevearc/dressing.nvim" -- Optional: Improves the default Neovim UI
        }
    }

    -- autoformatting
    use {
        "gpanders/nvim-parinfer"
    }

end)

vim.g.mapleader = ","
            
require("copilot").setup{
    filetypes = {
        sh = function ()
            if string.match(vim.fs.basename(vim.api.nvim_buf_get_name(0)), '^%.env.*') then
                -- disable for .env files
                return false
            end
            return true
        end,
    },
}

require('tsc').setup{
    auto_open_qflist = false
}

require("plugin_config.codecompanion")

require('vscode').setup{
    transparent = true,
    italic_comments = true
}

require('vscode').load()

local vscode_theme = require('lualine.themes.vscode')

vscode_theme.normal.b.bg = "#2f2f2f"
vscode_theme.normal.c.bg = "#2f2f2f"

vscode_theme.inactive.b.bg = "#2f2f2f"
vscode_theme.inactive.c.bg = "#2f2f2f"

require('lualine').setup{
    options = {
        theme = vscode_theme
    }
}



vim.cmd[[set number]]
vim.cmd[[set nowrap]]
vim.cmd[[set nohlsearch]]
vim.cmd[[autocmd InsertEnter * norm zz]]
vim.cmd[[set nosmarttab]]
vim.cmd[[set expandtab]]
vim.cmd[[set tabstop=4]]
vim.cmd[[set shiftwidth=4]]
vim.cmd[[set textwidth=80]]
vim.cmd[[set colorcolumn=80]]
vim.cmd[[set scrolloff=10]]
vim.cmd[[
    let g:prettier#autoformat = 1
    let g:prettier#autoformat_require_pragma = 0
]]

-- mappings
vim.keymap.set("i", "<c-e>", "<esc>A")
vim.keymap.set("i", "<c-a>", "<esc>I")
vim.keymap.set('i', 'jk', '<esc>')
vim.keymap.set('n', 'm', ':w<cr>')
vim.keymap.set('n', '<backspace>', '<c-w>w')
vim.keymap.set('n', '<c-n>', ':Ex<cr>')
vim.keymap.set('n', '<c-o>', '<c-o>zz')
vim.keymap.set('n', '<c-i>', '<c-i>zz')
vim.keymap.set("n", "<c-w>v", "<c-w>v<c-w>l")
vim.keymap.set("n", "<c-w>s", "<c-w>s<c-w>j")
vim.keymap.set("n", "<leader>h", function()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end)
vim.keymap.set("n", "<F1>", "<nop>")
vim.keymap.set("i", "<F1>", "<nop>")
vim.keymap.set("n", "<D-F1>", "<nop>")
vim.keymap.set("i", "<D-F1>", "<nop>")

vim.opt.termguicolors = true
vim.opt.swapfile = false


vim.filetype.add({
    extension = {
        st = 'clojure',
    },
})
