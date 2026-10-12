return {
  {
    "f-person/auto-dark-mode.nvim",
    opts = {
      update_interval = 1000,
      fallback = "dark",

      set_dark_mode = function()
        require("no-clown-fiesta").setup({
          theme = "dark",
          transparent = false,
        })

        vim.cmd.colorscheme("no-clown-fiesta")
      end,

      set_light_mode = function()
        require("no-clown-fiesta").setup({
          theme = "light",
          transparent = false,
        })

        vim.cmd.colorscheme("no-clown-fiesta")
      end,
    },
  },
}
