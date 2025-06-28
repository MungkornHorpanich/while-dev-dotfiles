function ColorMyPencils(color)
   color = color or "rose-pine"
   vim.cmd.colorscheme(color)

   vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
end

return {
   {
      "folke/tokyonight.nvim",
      config = function()
         require("tokyonight").setup({
            transparent = true, -- Enable this to disable setting the background color
            terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
            styles = {
               comments = { italic = false },
               keywords = { italic = false },
               sidebars = "dark", -- style for sidebars, see below
               floats = "dark", -- style for floating windows
            },
         })
         -- ColorMyPencils()

         -- vim.cmd("colorscheme tokyonight")
      end,
   },
   {
      "rose-pine/neovim",
      name = "rose-pine",
      config = function()
         require("rose-pine").setup({
            -- disable_background = true,
         })

         vim.cmd("colorscheme rose-pine")

         ColorMyPencils()
      end,
   },
   {
      "EdenEast/nightfox.nvim",
      priority = 1000,
      config = function()
         require("nightfox").setup({
            options = {
               transparent = true, -- Disable setting background
               terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
            },
         })

         -- vim.cmd("colorscheme nightfox")
      end,
   },
}
