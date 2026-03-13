vim.cmd('source ~/.vimrc')
require('config.lazy')
vim.opt.compatible = false
vim.opt.wrap = false
vim.opt.title = true
vim.opt.modeline = false
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 0
vim.opt.tabstop = A8
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.cindent = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.clipboard:append("unnamedplus")
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.makeprg = "ninja -C ${PWD}"
vim.opt.autowrite = true
vim.opt.autochdir = true
vim.opt.wildmode = "longest,list,full"
vim.opt.wildmenu = true
vim.opt.switchbuf = "useopen,usetab,newtab"
vim.opt.guioptions:remove("m")
vim.opt.guioptions:remove("T")
vim.opt.guioptions:remove("r")
vim.opt.guifont = "Hack Nerd Font:h11"
vim.opt.timeoutlen = 300

-- Set clang library path
vim.g.clang_library_path = "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/libclang.dylib"

-- CoQ settings
vim.g.coq_settings = { auto_start = 'shut-up' }

-- Spelunker settings
vim.g.spelunker_check_type = 2

-- ALE settings
vim.g.ale_fix_on_save = 1
vim.g.ale_linters_explicit = 1
vim.g.ale_php_cs_fixer_fix_options = '--config ' .. vim.fn.fnamemodify(vim.fn.findfile('.php-cs-fixer.php', './;'), ':p')
vim.g.airline_extensions_ale_enabled = 1

-- Set colorscheme

-- Arrow remap
vim.keymap.set({'n', 'v', 'o'}, 'j', 'h', { noremap = true, silent = true })
vim.keymap.set({'n', 'v', 'o'}, 'l', 'k', { noremap = true, silent = true })
vim.keymap.set({'n', 'v', 'o'}, 'k', 'j', { noremap = true, silent = true })
vim.keymap.set({'n', 'v', 'o'}, ';', 'l', { noremap = true, silent = true })
vim.keymap.set({'n', 'v', 'o'}, 'h', ';', { noremap = true, silent = true })


-- Key mappings
vim.keymap.set('n', '<F2>', ':tabp<CR>', {silent = true})
vim.keymap.set('n', '<F3>', ':tabn<CR>', {silent = true})
vim.keymap.set('n', '<F4>', ':Autoformat<CR>', {silent = true})
vim.keymap.set('n', '<F5>', '[(', {silent = true})
vim.keymap.set('n', '<F6>', '])', {silent = true})
vim.keymap.set('n', '<F7>', ':UndotreeToggle<CR>', {silent = true})
vim.keymap.set('n', '<F12>', ':source $MYVIMRC<CR>', {silent = true})
vim.keymap.set('n', '<leader>ev', ':e $MYVIMRC<CR>', {silent = true})
vim.keymap.set('i', 'jk', '<Esc>', {noremap = true})

-- ALE navigatio
vim.keymap.set('n', '<C-k>', '<Plug>(ale_previous_wrap)', {silent = true})
vim.keymap.set('n', '<C-j>', '<Plug>(ale_next_wrap)', {silent = true})

-- FZF mappings
vim.keymap.set('n', '<leader>a', ':ProjectRootExe Ag<CR>', {silent = true})
vim.keymap.set('n', '<leader>rg', ':ProjectRootExe Rg<CR>', {silent = true})
vim.keymap.set('n', '<leader>f', ':ProjectRootExe Files<CR>', {silent = true})
vim.keymap.set('n', '<leader>g', ':ProjectRootExe GFiles<CR>', {silent = true})
vim.keymap.set('n', '<leader>l', ':ProjectRootExe Lines<CR>', {silent = true})
vim.keymap.set('n', '<leader>b', ':Buffers<CR>', {silent = true})
vim.keymap.set('n', '<leader>n', ':Files ~/src/north-capital<CR>', {silent = true})
vim.keymap.set('n', '<leader>t', ':ProjectRootExe GFiles<CR>', {silent = true})

-- ProjectRoot mapping
vim.keymap.set('n', '<leader>ep', function()
  return ':edit ' .. vim.fn['projectroot#guess']() .. '/'
end, {expr = true})

-- Command abbreviations
vim.cmd([[
  cnoreabbrev <expr> ninja ((getcmdtype() is# ':' && getcmdline() is# "ninja")?("make"):("ninja"))
  cnoreabbrev <expr> install ((getcmdtype() is# ':' && getcmdline() is# "install")?("make install"):("install"))
]])

-- Autocommands
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Wrap text in specific file types
local wrap_text = augroup('kvl_wrap_text', {clear = true})
autocmd('FileType', {
  group = wrap_text,
  pattern = {'rst', 'tex'},
  callback = function()
    vim.opt_local.wrap = true
  end
})

-- C++ file settings
local cpp_stuff = augroup('cpp_stuff', {clear = true})
autocmd({'BufNewFile', 'BufRead'}, {
  group = cpp_stuff,
  pattern = {'*.ipp'},
  command = 'set filetype=cpp'
})
autocmd('FileType', {
  group = cpp_stuff,
  pattern = {'c', 'cpp', 'h', 'hpp', 'slang'},
  callback = function()
    vim.opt_local.cindent = true
    vim.opt_local.smartindent = true
  end
})
autocmd('FileType', {
  group = cpp_stuff,
  pattern = {'make'},
  callback = function()
    vim.opt_local.expandtab = false
  end
})
