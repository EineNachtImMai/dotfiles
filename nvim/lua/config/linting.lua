local lint = require("lint")

lint.linters_by_lt = {
  python = {"ruff"},
  rust = {"bacon"},
  javascript = {"quick-lint-js"},
  go = {"golangci-lint"}
}

local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

vim.api.nvim_create_autocmd(
  {
    "BufEnter",
    "BufWritePost",
    "InsertLeave"
  },
  {
    group = lint_augroup,
    callback = function()
      lint.try_lint()
    end
  }
)
