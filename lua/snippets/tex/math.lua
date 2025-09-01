local helpers = require("snippets.luasnip-helper-funcs")
local get_visual = helpers.get_visual

-- Math context detection
local tex = {}
tex.in_math = function() return vim.fn['vimtex#syntax#in_mathzone']() == 1 end
tex.in_text = function() return not tex.in_mathzone() end

return {
  s({ trig = "([^%l])mk", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta("<> $ <> $ ",
      {
        f(function(_, snip) return snip.captures[1] end),
        d(1, get_visual),
      }
    )
  ),

  s({ trig = "^mk", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta("$ <> $ ",
      {
        d(1, get_visual),
      }
    )
  ),

  s({ trig = "dm", snippetType = "autosnippet" },
    fmta(
      [[
      $$
        <>
      $$.
      <>
      ]],
      {
        d(1, get_visual),
        i(0)
      }
    )
  ),

  s({ trig = "//", snippetType = "autosnippet", condition = tex.in_math },
    fmta(
      "\\frac{<>}{<>}",
      { i(1), i(2) }
    )
  ),

}
