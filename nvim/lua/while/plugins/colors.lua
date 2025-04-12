-- Making transparent
function ColorMyPencils(color)
   color = color or "rose-pine"
   vim.cmd.colorscheme(color)
   vim.api.nvim_set_hl(0, "Normal", { bg = "none" })

end

return {
   {
      "folke/tokyonight.nvim",
      config = function()
      end,
   },
   {
      "rose-pine/neovim",
      name = "rose-pine",
      config = function()
            require('rose-pine').setup({
                disable_background = true,
            })

            vim.cmd("colorscheme rose-pine")

            ColorMyPencils()
        end
   },
}
