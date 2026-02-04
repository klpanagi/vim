-- [[ 2026 Stable Agentic Setup ]]
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Basic Settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.undofile = true
vim.opt.cursorline = true
vim.opt.termguicolors = true

-- Bootstrap Lazy.nvim
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system { 'git', 'clone', '--filter=blob:none', 'https://github.com/folke/lazy.nvim.git', '--branch=stable', lazypath }
  end
  vim.opt.rtp:prepend(lazypath)

  -- [[ Plugin Setup ]]
  require('lazy').setup({
    -- UI & Colors
    { 'folke/tokyonight.nvim', priority = 1000, config = function() vim.cmd.colorscheme 'tokyonight-moon' end },
    { 'folke/snacks.nvim', priority = 1000, lazy = false, opts = { dashboard = { enabled = true }, picker = { enabled = true } } },

	-- 1. THE FRONTEND: OpenCode.nvim
	{
	  "sudo-tee/opencode.nvim",
	  version = "*",
	  dependencies = { "nvim-lua/plenary.nvim", "sindrets/diffview.nvim" },
	  opts = {
	    keymap_prefix = "<leader>o",
	    -- We set this to 'vim_complete' so the plugin doesn't try to auto-inject its broken setup
	    preferred_completion = "vim_complete",
	  },
	},

	-- 2. THE ENGINE: Blink.cmp
	{
	  'saghen/blink.cmp',
	  version = '*',
	  opts = {
	    keymap = { preset = 'super-tab' },
	    sources = {
	      -- REMOVED 'agentic' to fix your module error.
	      -- Added 'opencode' which is the stable completion for your agent.
	      default = { 'lsp', 'path', 'snippets', 'buffer', 'opencode' },
	      providers = {
		opencode = {
		  name = 'OpenCode',
		  module = 'opencode.ui.completion.engines.blink_cmp',
		  score_offset = 100,
		},
	      },
	    },
	  },
	},

	-- LSP & Treesitter
	{ 'neovim/nvim-lspconfig', dependencies = { 'williamboman/mason.nvim', 'williamboman/mason-lspconfig.nvim' } },
	{ 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
  })

  -- [[ LSP Configuration ]]
  require('mason').setup()
  require('mason-lspconfig').setup {
    ensure_installed = { 'lua_ls' },
    handlers = {
      function(server_name)
      require('lspconfig')[server_name].setup({})
      end,
    },
  }

  -- [[ Autoread for Agent changes ]]
  vim.opt.autoread = true
  vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold" }, {
    callback = function()
    if vim.fn.mode() ~= 'c' then vim.cmd('checktime') end
      end,
  })

-- [[ Live Refresh Logic ]]
-- Uses LibUV to watch for file changes and refresh buffers automatically

local function setup_fs_watcher()
  local watcher = vim.uv.new_fs_event()
  local path = vim.fn.getcwd()

  watcher:start(path, { recursive = true }, vim.schedule_wrap(function(err, fname, events)
    if err then return end
    
    -- Only trigger if it's a file change (not a temp/git file)
    if fname and not fname:match("%.git") then
      -- 'checktime' reloads buffers that changed on disk but not in Nvim
      vim.cmd('checktime')
    end
  end))
end

-- Start watching on startup
setup_fs_watcher()

-- Fallback: Standard Autoread settings
vim.opt.autoread = true
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
  group = vim.api.nvim_create_augroup("AgenticRefresh", { clear = true }),
  callback = function()
    if vim.fn.mode() ~= 'c' then
      vim.cmd('checktime')
    end
  end,
})

-- [[ Agent Notification Hook ]]
vim.api.nvim_create_autocmd("User", {
  pattern = "OpencodeTaskDone", -- Hook provided by opencode.nvim
  callback = function()
    require("snacks").notifier.show({
      msg = "OpenCode: Task Completed!",
      level = "info",
      title = "Agent Status",
      icon = "🤖",
    })
    -- Force a final refresh just in case
    vim.cmd('checktime')
  end,
})
