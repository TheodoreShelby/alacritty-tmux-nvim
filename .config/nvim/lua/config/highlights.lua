local function apply()
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  vim.api.nvim_set_hl(0, "Comment", { fg = "#a6adc8", italic = true })

  for _, group in ipairs({
    "lualine_a_normal",
    "lualine_b_normal",
    "lualine_c_normal",
    "lualine_x_normal",
    "lualine_y_normal",
    "lualine_z_normal",
  }) do
    vim.api.nvim_set_hl(0, group, { bg = "none" })
  end
end

apply()
vim.api.nvim_create_autocmd("ColorScheme", { callback = apply })
