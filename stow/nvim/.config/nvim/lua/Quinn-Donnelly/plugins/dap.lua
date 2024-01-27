return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "theHamsta/nvim-dap-virtual-text",
        "rcarriga/nvim-dap-ui",
        "leoluz/nvim-dap-go",
        "folke/neodev.nvim",
    },
    config = function()
        require("dapui").setup()
        require("dap-go").setup()
        require("nvim-dap-virtual-text").setup()
        -- completeions for dap configs
        require("neodev").setup({
            library = { plugins = { "nvim-dap-ui" }, types = true },
        })

        local dap, dapui = require("dap"), require("dapui")
        dap.listeners.before.attach.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
            dapui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            dapui.close()
        end
    end
}
