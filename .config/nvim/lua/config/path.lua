-- Prepend common tool paths if missing (GUI Neovim often has a minimal PATH)
local paths = { "/usr/local/bin", "/opt/homebrew/bin", "/usr/local/go/bin" }
for _, p in ipairs(paths) do
  if vim.fn.isdirectory(p) == 1 and not vim.env.PATH:find(p, 1, true) then
    vim.env.PATH = p .. ":" .. vim.env.PATH
  end
end
