return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "ruff_format" },
        javascript = { "biome" },
        typescript = { "biome" },
        javascriptreact = { "biome" },
        typescriptreact = { "biome" },
        go = { "goimports" },
        sh = { "shfmt" },
        bash = { "shfmt" },
      },
    },
    keys = {
      {
        "<leader>cf",
        function()
          require("conform").format({ async = true, lsp_fallback = true })
        end,
        desc = "Format buffer",
      },
    },
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "mason-org/mason.nvim", "stevearc/conform.nvim" },
    opts = {
      ensure_installed = {
        "stylua",
        "ruff",
        "biome",
        "goimports",
        "shfmt",
      },
    },
  },
}
