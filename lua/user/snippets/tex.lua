local ls = require('luasnip')

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local extras = require("luasnip.extras")
local rep = extras.rep

ls.add_snippets('tex', {
    s("beg", {
        t("\\begin{"), i(1), t("}"),
        t({"", "\t"}), i(0),
        t({"", "\\end{"}), rep(1), t("}")
    })
})

ls.add_snippets('tex', {
    s("mk", {
        t("$"), i(1), t("$"), i(2)
    })
})

ls.add_snippets('tex', {
    s("dm", {
        t("\\["),
        t({"", "\t"}), i(1),
        t({"", ".\\]"}),
        i(0)
    })
})

ls.add_snippets('tex', {
    s("today", {
        f(function ()
            return os.date("%d-%m-%Y")
        end)
    })
})

ls.add_snippets('tex', {
    s("alph", {
        t("\\alpha ")
    })
})

ls.add_snippets('tex', {
    s("psi", {
        t("\\psi ")
    })
})
  -- s("//", { t("\\frac{"), i(1), t("}{"), i(2), t("}") }),
  -- s("sr", { t("^2") }),
  -- s("cb", { t("^3") }),

