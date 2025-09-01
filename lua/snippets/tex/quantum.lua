local helper = require("snippets.luasnip-helper-funcs")
local get_visual = helper.get_visual

-- Math context detection
local tex = {}
tex.in_math = function() return vim.fn['vimtex#syntax#in_mathzone']() == 1 end
tex.in_text = function() return not tex.in_mathzone() end

-- Definição dos snippets
return {

  s({ trig = "ket", snippetType = "autosnippet", wordTrig = true, condition = tex.in_math },
    t("\\ket ")
  ),

  s({ trig = "bra", snippetType = "autosnippet", wordTrig = true, condition = tex.in_math },
    t("\\bra ")
  ),

  s({ trig = "dag", snippetType = "autosnippet", wordTrig = true, condition = tex.in_math },
    fmta("<>^\\dag ", { i(1, "X") })
  ),

  s({ trig = "brk", snippetType = "autosnippet", wordTrig = true, condition = tex.in_math },
    fmta("\\braket{<> | <>}", { i(1, "\\alpha"), i(2, "\\alpha") })
  ),

  s({ trig = "expv", snippetType = "autosnippet", wordTrig = true, condition = tex.in_math },
    fmta("\\braket{<> | <> | <>}", { i(1, "\\alpha"), i(2, "\\hat{O}"), i(3, "\\alpha") })
  ),

  s({ trig = "ope", snippetType = "autosnippet", wordTrig = true },
    fmta("\\ket{<>}\\bra{<>}", { i(1, "\\alpha"), i(2, "\\alpha") }),
    { condition = tex.in_math }
  ),

  s({ trig = "norm", snippetType = "autosnippet", wordTrig = true },
    fmta("\\braket{<> | <>} = 1", { i(1, "\\alpha"), i(2, "\\alpha") }),
    { condition = tex.in_math }
  ),

}
