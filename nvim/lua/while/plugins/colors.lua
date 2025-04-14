-- Making transparent
-- function ColorMyPencils(color)
--    color = color or "onedark"
--    vim.cmd.colorscheme(color)
--    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- end
--
-- so this is the best way to config neovim for beginner

return {
   {
      "folke/tokyonight.nvim",
   },
   {
      "rose-pine/neovim",
      name = "rose-pine",
      config = function()
         require("rose-pine").setup({
            disable_background = true,
         })

         -- vim.cmd("colorscheme rose-pine")

         -- ColorMyPencils()
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

         vim.cmd("colorscheme nightfox")
      end,
   },
}
