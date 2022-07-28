-----------------------------------------------------------
-- Treesitter configuration file
----------------------------------------------------------

-- Plugin: nvim-treesitter
-- url: https://github.com/nvim-treesitter/nvim-treesitter


local status_ok, nvim_treesitter = pcall(require, 'nvim-treesitter.configs')
if not status_ok then
  return
end

-- See: https://github.com/nvim-treesitter/nvim-treesitter#quickstart
nvim_treesitter.setup {
  autopairs = {
    enable = true,
  },
  -- A list of parser names, or "all"
  ensure_installed = {
    -- Lang
    'html', 'css', 'c', 'cpp', 'javascript', 'typescript', 'python', 'go', 'rust',
    -- Filetype specific
    'json', 'toml', 'markdown',
    -- Bash & script
    'bash', 'lua', 'vim', 'dockerfile', 'fish',
  },
  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,
  highlight = {
    -- `false` will disable the whole extension
    enable = true,
    additional_vim_regex_highlighting = true,
  },
  indent = { enable = true, disable = {"yaml", "python", "css"}},
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  }
}

