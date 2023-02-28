require("mini.move").setup({
    mappings = {
    -- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
    left = '<S-h>',
    right = '<S-l>',
    down = '<S-j>',
    up = '<S-k>',

    -- Move current line in Normal mode
    line_left = '<Nop>',
    line_right = '<Nop>',
    line_down = '<Nop>',
    line_up = '<Nop>',
  },
})
