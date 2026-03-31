return {
  "hrsh7th/cmp-nvim-lsp",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/lazydev.nvim",                  opts = {} },
  },
  config = function()
    -- import cmp-nvim-lsp plugin
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = cmp_nvim_lsp.default_capabilities()

    vim.lsp.config("*", {
      capabilities = capabilities,
    })

    -- Setup clangd for C++23
    vim.lsp.config("clangd", {
      cmd = {
        "clangd",
        "--background-index",
        "--clang-tidy",
        "--header-insertion=iwyu",
        "--completion-style=detailed",
        "--function-arg-placeholders",
        "--fallback-style=llvm",
      },
      filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
      root_markers = {
        ".clangd",
        ".clang-tidy",
        ".clang-format",
        "compile_commands.json",
        "compile_flags.txt",
        "configure.ac",
        ".git",
      },
      capabilities = capabilities,
      init_options = {
        fallbackFlags = { "-std=c++23" },
      },
    })
    vim.lsp.enable("clangd")

    -- Setup Dart language server (only if Flutter is not installed)
    if vim.fn.executable("flutter") == 0 then
      vim.lsp.config("dartls", {
        cmd = { "dart", "language-server", "--protocol=lsp" },
        filetypes = { "dart" },
        root_markers = { "pubspec.yaml" },
        capabilities = capabilities,
        settings = {
          dart = {
            completeFunctionCalls = true,
            showTodos = true,
            enableSnippets = true,
            updateImportsOnRename = true,
          },
        },
      })
      vim.lsp.enable("dartls")
    end
  end,
}
