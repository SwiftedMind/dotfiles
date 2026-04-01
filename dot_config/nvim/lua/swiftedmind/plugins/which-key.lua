return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
  end,
  opts = {
    preset = "modern",
    spec = {
      { "<leader>c", group = "code" },
      { "<leader>e", group = "explorer" },
      { "<leader>f", group = "find" },
      { "<leader>h", group = "git" },
      { "<leader>m", group = "format" },
      { "<leader>n", group = "search" },
      { "<leader>r", group = "lsp" },
      { "<leader>s", group = "split" },
      { "<leader>t", group = "tab" },
      { "<leader>w", group = "workspace" },
      { "<leader>x", group = "trouble" },
    },
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer local keymaps",
    },
  },
}
