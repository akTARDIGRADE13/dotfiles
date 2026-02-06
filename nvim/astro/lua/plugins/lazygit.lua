return {
  {
    "kdheepak/lazygit.nvim",
    cmd = { "LazyGit", "LazyGitConfig", "LazyGitCurrentFile", "LazyGitFilter", "LazyGitFilterCurrentFile" },
    keys = {
      { "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
      { "<leader>gF", "<cmd>LazyGitCurrentFile<cr>", desc = "LazyGit (current file)" },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
}

