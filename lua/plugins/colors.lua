local function enable_transparency()
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end
return {
    {
        "L-Colombo/oldschool.nvim",
        config = function()
            vim.opt.termguicolors = true
            require("oldschool").setup({})
            vim.cmd.colorscheme "oldschool"
            enable_transparency()
        end,
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        opts = {
            theme = "oldschool",
        }
    },
}
