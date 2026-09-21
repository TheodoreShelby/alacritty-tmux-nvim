return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    local ts = require("nvim-treesitter")
    local parsers = {
      "lua",
      "python",
      "typescript",
      "tsx",
      "javascript",
      "go",
      "bash",
      "markdown",
    }

    ts.setup()

    local installed = ts.get_installed()
    local missing = vim.tbl_filter(function(p)
      return not vim.tbl_contains(installed, p)
    end, parsers)

    if #missing > 0 then
      ts.install(missing)
    end
  end,
}
