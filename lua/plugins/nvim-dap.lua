return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "nvim-neotest/nvim-nio",  -- Required dependency for nvim-dap-ui
        "rcarriga/nvim-dap-ui",  -- Optional UI for a better experience
        "jay-babu/mason-nvim-dap.nvim",
        "williamboman/mason.nvim",  -- For managing debuggers
    },
    config = function()
        require("mason").setup()
        require("mason-nvim-dap").setup({
            ensure_installed = { "python","go"},
        })
    end
}

