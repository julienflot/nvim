return {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        renderer = {
            icons = {
                show = {
                    git = false
                }
            }
        }
    }
}
