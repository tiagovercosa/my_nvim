local helper = require("snippets.luasnip-helper-funcs")
local get_vision = helper.get_visual
local line_begin = require("luasnip.extras.expand_conditions").line_begin

local tex_utils = {}
tex_utils.in_env = function(name)
  local is_inside = vim.fn['vimtex#env#is_inside'](name)
  return (is_inside[1] > 0 and is_inside[2] > 0)
end

return {
  s({ trig = "ssec", snippetType = "autosnippet", condition = line_begin },
    fmta([[\section{<>}]], { i(1) })
  ),

  s({ trig = "beg", snippetType = "autosnippet", condition = line_begin },
    fmta(
      [[
      \begin{<>}
        <>
      \end{<>}
      ]],
      { i(1), i(2), rep(1) }
    )
  ),

  s({ trig = "itmz", snippetType = "autosnippet", condition = line_begin },
    fmta([[
    \begin{itemize}
      \item <>
    \end{itemize}
    ]], { i(0) })
  ),

  s({
      trig = "item",
      snippetType = "autosnippet",
      condition = function()
        return tex_utils.in_env("itemize") or tex_utils.in_env("enumerate")
      end
    },
    t("\\item ")
  ),

  s({ trig = "definition", snippetType = "autosnippet", wordTrig = true },
    fmta([[
    \begin{definition}
        <>
    \end{definition}
    ]], { i(1) })
  ),

  s({ trig = "postulate", snippetType = "autosnippet", wordTrig = true },
    fmta([[
    \begin{postulate}
        <>
    \end{postulate}
    ]], { i(1) })
  ),

  s({ trig = "observacao", snippetType = "autosnippet", wordTrig = true },
    fmta([[
    \begin{observacao}
        <>
    \end{observacao}
    ]], { i(1) })
  ),

}
