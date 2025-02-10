local mini_modules = {
    "mini.ai",
    "mini.surround"
}

for _, module in ipairs(mini_modules) do
    require(module).setup()
end
