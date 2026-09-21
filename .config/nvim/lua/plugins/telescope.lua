-- Search only within the directory Neovim is in (getcwd).
local fd_excludes = {
  "--exclude", "node_modules",
  "--exclude", ".git",
  "--exclude", "dist",
  "--exclude", "build",
}

local function in_project(picker, opts)
  picker(vim.tbl_extend("force", { cwd = vim.fn.getcwd() }, opts or {}))
end

local function find_files(opts)
  if vim.fn.executable("fd") ~= 1 then
    vim.notify("fd not found — install with: brew install fd", vim.log.levels.WARN)
    in_project(require("telescope.builtin").find_files, opts)
    return
  end

  opts = vim.tbl_extend("force", { cwd = vim.fn.getcwd() }, opts or {})
  local pickers = require("telescope.pickers")
  local finders = require("telescope.finders")
  local make_entry = require("telescope.make_entry")
  local conf = require("telescope.config").values

  pickers.new(opts, {
    prompt_title = "Find Files",
    finder = finders.new_job(function(prompt)
      if not prompt or prompt == "" then
        return nil
      end
      return vim.tbl_flatten {
        "fd",
        "-H",
        "--type",
        "f",
        "--strip-cwd-prefix",
        "--color",
        "never",
        fd_excludes,
        prompt,
      }
    end, make_entry.gen_from_file(opts), opts.max_results, opts.cwd),
    sorter = conf.file_sorter(opts),
    previewer = conf.file_previewer(opts),
  }):find()
end

return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    defaults = {
      get_status_text = function(picker, opts)
        local status_icon = (opts and not opts.completed) and "*" or ""
        if not picker.manager then
          return status_icon
        end
        local n = picker.manager:num_results() or 0
        if n == 0 then
          return status_icon
        end
        local idx = picker:get_index(picker:get_selection_row())
        return string.format("%s%d/%d", status_icon, idx, n)
      end,
      file_ignore_patterns = {
        ".git/",
        "node_modules/",
        "dist/",
        "build/",
        "yarn.lock",
        "package-lock.json",
        "pnpm-lock.yaml",
      },
      vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
        "--glob", "!node_modules",
        "--glob", "!.git",
        "--glob", "!yarn.lock",
        "--glob", "!package-lock.json",
        "--glob", "!pnpm-lock.yaml",
      },
    },
  },
  keys = {
    {
      "<leader>ff",
      function()
        find_files()
      end,
      desc = "Find files",
    },
    {
      "<leader>fg",
      function()
        in_project(require("telescope.builtin").live_grep)
      end,
      desc = "Live grep",
    },
    { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
    { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help" },
  },
}
