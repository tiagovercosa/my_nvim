return {
  "3rd/image.nvim",
  config = function()
    require("image").setup({
      backend = "kitty",
      max_width_window_percentage = 50,
      max_height_window_percentage = 50,
      scale_factor = 1.0,
    })
  end
}
