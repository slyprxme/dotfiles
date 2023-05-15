return {
  cmd = { "pyright-langserver", "--stdio" },
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        typeCheckingMode = "basic",
        diagnosticMode = "workspace",
        inlayHints = {
          variableTypes = true,
          functionReturnTypes = true,
        },
      },
    },
  },
}
