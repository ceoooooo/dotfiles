local spec = {
    "j-hui/fidget.nvim",
    tag = "legacy",
    event = "LspAttach",
}

spec.config = function()
    require("fidget").setup()
end

return { spec }
