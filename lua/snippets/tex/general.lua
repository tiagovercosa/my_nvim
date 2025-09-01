local helper = require("snippets.luasnip-helper-funcs")
local get_visual = helper.get_visual

local tex = {}
tex.in_math = function() return vim.fn['vimtex#syntax#in_mathzone']() == 1 end
tex.in_text = function() return not tex.in_math() end

return {
  s({ trig = "bf", snippetType = "autosnippet", wordTrig = true, condition = tex.in_text },
    fmta("\\textbf{<>} ",
      d(1, get_visual)
    )
  ),

  s({ trig = "itt", snippetType = "autosnippet", wordTrig = true },
    fmta("\\textit{<>} ",
      d(1, get_visual)
    )
  ),

  s({ trig = "bf", snippetType = "autosnippet", wordTrig = true, condition = tex.in_math },
   fmta("\\mathbf{<>} ", { i(1) })
  ),

}
