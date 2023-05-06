local status_ok, mason = pcall(require, "mason")
if not status_ok then
  return
end

local status_ok_1, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok_1 then
  return
end

local servers = {
  -- "cssls",
  -- "cssmodules_ls",
  -- "emmet_ls",
  -- "eslint",
  -- "html",
  -- "jdtls",
  -- "jsonls",
  -- "solc",
  -- "solidity_ls",
  "lua_ls",
  -- "tflint",
  -- "terraformls",
  -- "tsserver",
  "pyright",
  -- "pylsp",
  -- "yamlls",
  -- "bashls",
  -- "clangd",
  -- "rust_analyzer",
  -- "taplo",
  -- "zk@v0.10.1",
  -- "lemminx"
}

local settings = {
  ui = {
    check_outdated_packages_on_open = true,
    width = 0.8,
    height = 0.9,
    border = "rounded",
    keymaps = {
      toggle_package_expand = "<CR>",
      install_package = "i",
      update_package = "u",
      check_package_version = "c",
      update_all_packages = "U",
      check_outdated_packages = "C",
      uninstall_package = "X",
      cancel_installation = "<C-c>",
      apply_language_filter = "<C-f>",
    },
    icons = {
      package_pending = "",
      package_installed = "",
      package_uninstalled = "ﮊ",
    },
  },
}

mason.setup(settings)
mason_lspconfig.setup({
  ensure_installed = servers,
  automatic_installation = true,
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
  return
end

local opts = {}

for _, server in pairs(servers) do
  opts = {
    on_attach = require("plugins.configs.lsp.handlers").on_attach,
    capabilities = require("plugins.configs.lsp.handlers").capabilities,
  }

  server = vim.split(server, "@")[1]

  if server == "lua_ls" then
    local lua_opts = require("plugins.configs.lsp.settings.lua_ls")
    opts = vim.tbl_deep_extend("force", lua_opts, opts)
  end

  -- if server == "yamlls" then
  --   local yamlls_opts = require "user.lsp.settings.yamlls"
  --   opts = vim.tbl_deep_extend("force", yamlls_opts, opts)
  -- end

  -- if server == "tsserver" then
  -- 	local tsserver_opts = require("user.lsp.settings.tsserver")
  -- 	opts = vim.tbl_deep_extend("force", tsserver_opts, opts)
  -- end

  -- if server == "pyright" then
  -- 	local pyright_opts = require("user.lsp.settings.pyright")
  -- 	opts = vim.tbl_deep_extend("force", pyright_opts, opts)
  -- end

  -- if server == "solc" then
  --   local solc_opts = require "user.lsp.settings.solc"
  --   opts = vim.tbl_deep_extend("force", solc_opts, opts)
  -- end

  -- if server == "cssls" then
  -- 	local cssls_opts = require("user.lsp.settings.cssls")
  -- 	opts = vim.tbl_deep_extend("force", cssls_opts, opts)
  -- end

  -- if server == "emmet_ls" then
  -- 	local emmet_ls_opts = require("user.lsp.settings.emmet_ls")
  -- 	opts = vim.tbl_deep_extend("force", emmet_ls_opts, opts)
  -- end

  -- if server == "eslint" then
  -- 	local eslint_opts = require("user.lsp.settings.eslint")
  -- 	opts = vim.tbl_deep_extend("force", eslint_opts, opts)
  -- end

  -- if server == "html" then
  -- 	local html_opts = require("user.lsp.settings.html")
  -- 	opts = vim.tbl_deep_extend("force", html_opts, opts)
  -- end

  -- if server == "zk" then
  --   local zk_opts = require "user.lsp.settings.zk"
  --   opts = vim.tbl_deep_extend("force", zk_opts, opts)
  -- end
  --
  -- if server == "jdtls" then
  --   goto continue
  -- end

  -- if server == "rust_analyzer" then
  --   local rust_opts = require "user.lsp.settings.rust"
  --   -- opts = vim.tbl_deep_extend("force", rust_opts, opts)
  --   local rust_tools_status_ok, rust_tools = pcall(require, "rust-tools")
  --   if not rust_tools_status_ok then
  --     return
  --   end
  --
  --     rust_tools.setup(rust_opts)
  --     goto continue
  --   end
  --
  lspconfig[server].setup(opts)
end
