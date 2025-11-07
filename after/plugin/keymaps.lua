local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- better indenting
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

keymap("n", "gf", "<C-W>gf")



--latex
-- Compilation
keymap('n', '<leader>lc', '<cmd>VimtexCompile<CR>', opts)
keymap('n', '<leader>ll', '<cmd>VimtexCompileToggle<CR>', opts)
keymap('n', '<leader>lC', '<cmd>VimtexClean<CR>', opts)

-- Viewing
keymap('n', '<leader>lv', '<cmd>VimtexView<CR>', opts)
keymap('n', '<leader>lr', '<cmd>VimtexReverseSearch<CR>', opts)

-- Errors and info
keymap('n', '<leader>le', '<cmd>VimtexErrors<CR>', opts)
keymap('n', '<leader>li', '<cmd>VimtexInfo<CR>', opts)
keymap('n', '<leader>lI', '<cmd>VimtexInfoAll<CR>', opts)

-- Toggles
keymap('n', '<leader>lt', '<cmd>VimtexTocToggle<CR>', opts)
keymap('n', '<leader>lf', '<cmd>VimtexFoldToggle<CR>', opts)

-- Text objects (for navigating environments, commands, etc.)
keymap('x', 'ic', '<plug>(vimtex-ic)')
keymap('x', 'ac', '<plug>(vimtex-ac)')
keymap('o', 'ic', '<plug>(vimtex-ic)')
keymap('o', 'ac', '<plug>(vimtex-ac)')



-- "Select mode" is what luasnip ends up in when snippets contain placeholder text
--vim.keymap.set({ "i", "s" }, "<Tab>",
--        function()
--          if ls.expand_or_locally_jumpable() then
--            ls.expand_or_jump()
--          end
--        end,
--        { desc = "Expand or jump forward in lua-snippet", silent = true })
--
--vim.keymap.set({ "i", "s" }, "<Shift-Tab>", function()
--        if ls.jumpable(-1) then
--          ls.jump(-1)
--        end
--      end, { desc = "Jump backward in lua-snippet", silent = true })
--
--vim.keymap.set({ "i", "s" }, "<C-B>", function()
--        if ls.jumpable(-1) then
--          ls.jump(-1)
--        end
--      end, { desc = "Jump backward in lua-snippet", silent = true })
--
--vim.keymap.set({"i", "s"}, "<Tab>", function()
--        if ls.choice_active() then
--          ls.change_choice(1)
--        end
--      end, { desc = "Switch between choices in lua-snippet", silent = true})
--
--
