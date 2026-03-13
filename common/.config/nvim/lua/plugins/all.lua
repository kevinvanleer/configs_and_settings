return {
  -- Tpope plugins
  { "tpope/vim-endwise" },
  { "tpope/vim-leiningen" },
  { "tpope/vim-fireplace" },
  { "tpope/vim-fugitive" },

  -- Language support
  { "vim-scripts/L9" },
  { "sheerun/vim-polyglot" },
  { "kana/vim-operator-user" },
  { "vim-scripts/taglist.vim" },
  { "guns/vim-clojure-static" },
  { "pangloss/vim-javascript" },
  { "mfukar/robotframework-vim" },
  { "Glench/Vim-Jinja2-Syntax" },
  { "venantius/vim-cljfmt" },
  { "cemerick/piggieback" },
  { "leafgarland/typescript-vim" },
  { "shmup/vim-sql-syntax" },
  { "martinda/Jenkinsfile-vim-syntax" },

  -- Completion and LSP
  { "ms-jpq/coq_nvim", branch = "coq" },
  { "ms-jpq/coq.artifacts", branch = "artifacts" },
  { "neovim/nvim-lspconfig" },

  -- Editor enhancements
  { "mbbill/undotree" },
  { "bling/vim-airline" },
  { "alvan/vim-closetag" },
  { "dense-analysis/ale" },
  { "Rykka/riv.vim" },
  { "wojtekmach/vim-rename" },
  { "kamykn/spelunker.vim" },
  { "rstacruz/vim-closer" },

  -- Markdown support
  { "shime/vim-livedown" },

  -- Fuzzy finding
  { 
    "junegunn/fzf", 
    build = function() vim.fn["fzf#install"]() end 
  },
  { "junegunn/fzf.vim" },

  -- Project management
  { "dbakker/vim-projectroot" },

  -- Colors
  { "flazz/vim-colorschemes", config = function() 
      vim.cmd('colorscheme SlateDark')
  end, },
  { "xolox/vim-colorscheme-switcher" },
  { "xolox/vim-misc", priority = 1000, },

  -- Folding
  { "kevinhwang91/promise-async" },
  { "kevinhwang91/nvim-ufo", dependencies = { "kevinhwang91/promise-async" } },
  
 {
  "coder/claudecode.nvim",
  dependencies = { "folke/snacks.nvim" },
  config = true,
  keys = {
      { "<leader>l", nil, desc = "AI/Claude Code" },
      { "<leader>lc", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
      { "<leader>lf", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
      { "<leader>lr", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude" },
      { "<leader>lC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
      { "<leader>lm", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
      { "<leader>lb", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer" },
      { "<leader>ls", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send to Claude" },
      {
        "<leader>as",
        "<cmd>ClaudeCodeTreeAdd<cr>",
        desc = "Add file",
        ft = { "NvimTree", "neo-tree", "oil", "minifiles" },
      },
      -- Diff management
      { "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
      { "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
    },
  },
}
