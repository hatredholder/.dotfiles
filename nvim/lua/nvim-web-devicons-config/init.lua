local nvim_web_devicons = require "nvim-web-devicons"

local current_icons = nvim_web_devicons.get_icons()
local new_icons = {}

-- Set default color
for key, icon in pairs(current_icons) do
    icon.color = "#C6C0A9"
    icon.cterm_color = 198
    new_icons[key] = icon
end

nvim_web_devicons.set_icon(new_icons)
