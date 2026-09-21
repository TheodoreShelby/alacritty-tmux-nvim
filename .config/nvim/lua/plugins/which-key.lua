return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    spec = {
      { "<leader>f", group = "Find" },
      { "<leader>p", group = "Project" },
      { "<leader>c", group = "Code" },
    },
  },
}
