local mason = {
    "williamboman/mason.nvim",
    cmd = "Mason",
    event = "BufReadPre",
    opts = {
        ui = {
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗",
            },
        },
    },
}

local mason_lspconfig = {
    "williamboman/mason-lspconfig.nvim",
    event = "BufReadPre",
    dependencies = { "williamboman/mason.nvim" },
    opts = {
        ensure_installed = {
            "solidity_ls",
            "efm",
            "bashls",
            "tsserver",
            "tailwindcss",
            "pyright",
            "lua_ls",
            "emmet_ls",
            "jsonls",
            "dockerls",
            "gopls",
            "html",
            "cssls",
            "volar",
            "intelephense",
            "sqls",
            "clangd",
            "svelte",
            "rust_analyzer",
        },
        automatic_installation = true,
    },
}

local mason_tool_installer = {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    event = "BufReadPre",
    dependencies = { "williamboman/mason.nvim" },
    opts = {
        ensure_installed = {
            "eslint_d",
            "prettierd",
            "luacheck",
            "stylua",
            "shellcheck",
            "shfmt",
            "cpplint",
            "gofumpt",
            "golangci-lint",
            "solhint",
            "fixjson",
            "stylelint",
            "phpcbf",
            "svelte",
        },
        auto_update = true,
        run_on_start = true,
    },
}

return {
    mason,
    mason_lspconfig,
    mason_tool_installer,
}
