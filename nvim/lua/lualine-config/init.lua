local utils = require("lualine.utils.utils") local highlight = require("lualine.highlight")

local diagnostics_message = require("lualine.component"):extend()

diagnostics_message.default = {
	colors = {
		error = utils.extract_color_from_hllist(
			{ "fg", "sp" },
			{ "DiagnosticError", "LspDiagnosticsDefaultError", "DiffDelete" },
			"#e32636"
		),
		warning = utils.extract_color_from_hllist(
			{ "fg", "sp" },
			{ "DiagnosticWarn", "LspDiagnosticsDefaultWarning", "DiffText" },
			"#ffa500"
		),
		info = utils.extract_color_from_hllist( { "fg", "sp" },
			{ "DiagnosticInfo", "LspDiagnosticsDefaultInformation", "DiffChange" },
			"#ffffff"
		),
		hint = utils.extract_color_from_hllist(
			{ "fg", "sp" },
			{ "DiagnosticHint", "LspDiagnosticsDefaultHint", "DiffAdd" },
			"#273faf"
		),
	},
}
function diagnostics_message:init(options)
	diagnostics_message.super:init(options)
	self.options.colors = vim.tbl_extend("force", diagnostics_message.default.colors, self.options.colors or {})
	self.highlights = { error = "", warn = "", info = "", hint = "" }
	self.highlights.error = highlight.create_component_highlight_group(
		{ fg = self.options.colors.error },
		"diagnostics_message_error",
		self.options
	)
	self.highlights.warn = highlight.create_component_highlight_group(
		{ fg = self.options.colors.warn },
		"diagnostics_message_warn",
		self.options
	)
	self.highlights.info = highlight.create_component_highlight_group(
		{ fg = self.options.colors.info },
		"diagnostics_message_info",
		self.options
	)
	self.highlights.hint = highlight.create_component_highlight_group(
		{ fg = self.options.colors.hint },
		"diagnostics_message_hint",
		self.options
	)
end

function diagnostics_message:update_status()
	local r, _ = unpack(vim.api.nvim_win_get_cursor(0))
	local diagnostics = vim.diagnostic.get(0, { lnum = r - 1 })
	if #diagnostics > 0 then
		local diag = diagnostics[1]
		for _, d in ipairs(diagnostics) do
			if d.severity < diag.severity then
				diagnostics = d
			end
		end
		local icons = { " ", " ", " ", " " }
		local hl = { self.highlights.error, self.highlights.warn, self.highlights.info, self.highlights.hint }
		return highlight.component_format_highlight(hl[diag.severity]) .. icons[diag.severity] .. " " .. diag.message
	else
		return ""
	end
end

local custom_auto = require('lualine.themes.auto')

custom_auto.normal.c.bg = 'None'
custom_auto.insert.c.bg = 'None'
custom_auto.visual.c.bg = 'None'
custom_auto.command.c.bg = 'None'

require('lualine').setup({
  options = {
    theme = custom_auto,
    disabled_filetypes = {
      'packer', 'neo-tree', "dashboard", "TelescopePrompt", "DiffviewFilePanel", "diff", "undotree"
    },
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {diagnostics_message},
    lualine_x = {'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
})

vim.cmd([[
highlight! lualine_c_inactive guibg=#323b42
]])
