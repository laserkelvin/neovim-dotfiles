return {
  {
    "jpmcb/nvim-llama",
    config = function()
      require("nvim-llama").setup({
        model = "deepseek-coder:6.7b",
      })
    end,
  },
}
