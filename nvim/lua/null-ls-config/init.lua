require("null-ls").setup({
    sources = {
        require("null-ls").builtins.diagnostics.flake8,

        require("null-ls").builtins.formatting.black,
        require("null-ls").builtins.formatting.stylua,
        require("null-ls").builtins.completion.spell,

        -- require("null-ls").builtins.diagnostics.djlint,
    },
})
