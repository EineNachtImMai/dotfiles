local ls = require("luasnip")

ls.config.setup({ enable_autosnippets = true })

ls.add_snippets("rust", require("custom.snippets.rust"))
ls.add_snippets("python", require("custom.snippets.python"))
ls.add_snippets("lua", require("custom.snippets.lua"))
ls.add_snippets("typst", require("custom.snippets.typst"))
