return {
    'nvim-telescope/telescope.nvim',
    tag = 'v0.1.9',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope-live-grep-args.nvim',
    },
    config = function()
        local telescope = require('telescope')
        local lga_actions = require('telescope-live-grep-args.actions')

        telescope.setup({
            extensions = {
                live_grep_args = {
                    auto_quoting = true,
                    mappings = {
                        i = {
                            ['<C-k>'] = lga_actions.quote_prompt(),
                            ['<C-i>'] = lga_actions.quote_prompt({ postfix = ' --iglob ' }),
                            ['<C-space>'] = lga_actions.to_fuzzy_refine,
                        },
                    },
                },
            },
        })

        telescope.load_extension('live_grep_args')

        local keymap = vim.keymap
        keymap.set('n', '<leader>/', function()
            require('telescope').extensions.live_grep_args.live_grep_args()
        end, { desc = 'Live grep with args' })

        keymap.set('n', '<leader>*', function()
            require('telescope-live-grep-args.shortcuts').grep_word_under_cursor()
        end, { desc = 'Grep word under cursor' })
    end,
}
