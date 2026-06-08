return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  config = function()
    local parsers = {
      "json",
      "javascript",
      "typescript",
      "tsx",
      "yaml",
      "html",
      "css",
      "prisma",
      "markdown",
      "markdown_inline",
      "svelte",
      "graphql",
      "bash",
      "lua",
      "vim",
      "dockerfile",
      "gitignore",
      "query",
      "vimdoc",
      "c",
    }

    local treesitter = require("nvim-treesitter")

    treesitter.setup({
      install_dir = vim.fn.stdpath("data") .. "/site",
    })

    -- Do not install parsers during normal startup. On a fresh machine this creates
    -- noisy "Press ENTER" messages and slows every launch while downloads run.
    vim.api.nvim_create_user_command("TSInstallAll", function()
      treesitter.install(parsers)
    end, { desc = "Install all configured Tree-sitter parsers" })

    require("nvim-ts-autotag").setup()

    local group = vim.api.nvim_create_augroup("swiftedmind-treesitter", { clear = true })
    vim.api.nvim_create_autocmd("FileType", {
      group = group,
      pattern = "*",
      callback = function(args)
        local ok = pcall(vim.treesitter.start, args.buf)
        if not ok then
          return
        end

        vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })

    vim.keymap.set("n", "<C-space>", "v_an", { desc = "Expand selection", remap = true })
    vim.keymap.set("x", "<C-space>", "an", { desc = "Expand selection", remap = true })
    vim.keymap.set("x", "<BS>", "in", { desc = "Shrink selection", remap = true })
  end,
}
