local npairs = require('nvim-autopairs')

npairs.setup({break_line_filetype = nil, check_ts = true})

local cmp_autopairs = require('nvim-autopairs.completion.cmp')
require('cmp').event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)
