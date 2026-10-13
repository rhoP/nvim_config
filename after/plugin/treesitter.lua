-- Enable Tree-sitter highlighting for supported filetypes.
vim.api.nvim_create_autocmd("FileType", {
    callback = function(args)
        -- vimtex provides its own (richer) syntax highlighting for LaTeX
        if args.match == "tex" or args.match == "plaintex" or args.match == "bib" then
            return
        end
        pcall(vim.treesitter.start, args.buf)
    end,
})
