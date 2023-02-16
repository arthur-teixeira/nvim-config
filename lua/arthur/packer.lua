-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use({
        'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            vim.cmd('colorscheme rose-pine')
        end
    })

    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })

    use 'theprimeagen/harpoon'

    use 'mbbill/undotree'

    use 'tpope/vim-fugitive'

    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            -- Snippet Collection (Optional)
            { 'rafamadriz/friendly-snippets' },
        },


    }
    use 'ThePrimeagen/vim-be-good'

    use 'tpope/vim-surround'

    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    use {
        'glepnir/dashboard-nvim',
        event = 'VimEnter',
        config = function()
            require('dashboard').setup {
                -- config
            }
        end,
        requires = { 'nvim-tree/nvim-web-devicons' }
    }

    use({
        'CosmicNvim/cosmic-ui',
        requires = { 'MunifTanjim/nui.nvim', 'nvim-lua/plenary.nvim' },
        config = function()
            require('cosmic-ui').setup()
        end,
    })


    use {
        "klen/nvim-test",
        config = function()
            require('nvim-test').setup {
                run = true, -- run tests (using for debug)
                commands_create = true, -- create commands (TestFile, TestLast, ...)
                filename_modifier = ":.", -- modify filenames before tests run(:h filename-modifiers)
                silent = false, -- less notifications
                term = "terminal", -- a terminal to run ("terminal"|"toggleterm")
                termOpts = {
                    direction = "vertical", -- terminal's direction ("horizontal"|"vertical"|"float")
                    width = 96, -- terminal's width (for vertical|float)
                    height = 24, -- terminal's height (for horizontal|float)
                    go_back = false, -- return focus to original window after executing
                    stopinsert = "auto", -- exit from insert mode (true|false|"auto")
                    keep_one = true, -- keep only one terminal for testing
                },
                runners = { -- setup tests runners
                    cs = "nvim-test.runners.dotnet",
                    go = "nvim-test.runners.go-test",
                    haskell = "nvim-test.runners.hspec",
                    javascriptreact = "nvim-test.runners.jest",
                    javascript = "nvim-test.runners.mocha",
                    lua = "nvim-test.runners.busted",
                    python = "nvim-test.runners.pytest",
                    ruby = "nvim-test.runners.rspec",
                    rust = "nvim-test.runners.cargo-test",
                    typescript = "nvim-test.runners.jest",
                    typescriptreact = "nvim-test.runners.jest",
                }
            }
        end
    }
    use 'Mofiqul/dracula.nvim'

    use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }

    use 'ofirgall/goto-breakpoints.nvim'

    use { "Pocco81/DAPInstall.nvim", as = "dap-install" }

    use { 'nvim-telescope/telescope-dap.nvim' }

    use 'chentoast/marks.nvim'

    use({
        "utilyre/barbecue.nvim",
        tag = "*",
        requires = {
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons", -- optional dependency
        },
        after = "nvim-web-devicons", -- keep this if you're using NvChad
        config = function()
            require("barbecue").setup()
        end,
    })
end)
