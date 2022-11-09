local import_parsers, parsers = pcall(require, 'nvim-treesitter.parsers')
if import_parsers then
	local parsername = parsers.filetype_to_parsername
	parsername.htmldjango = 'html' 
end


local import_tag, autotag = pcall(require, "nvim-ts-autotag")
if not import_tag then return end
autotag.setup({
	autotag = {
		enable = true,
	},
	filetypes = {
		'html', 'htmldjango',
	},
})

require'nvim-treesitter.configs'.setup {
  autotag = {
    enable = true,
  },
  -- A list of parser names, or "all"
  ensure_installed = {"python"},

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  }
}
