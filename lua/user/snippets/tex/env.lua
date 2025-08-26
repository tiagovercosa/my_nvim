-- Snippets para criação de ambientes durante a escrita

local ls = require("luasnip")
local s  = ls.snippet
local i  = ls.insert_node
local c  = ls.choice_node
local f  = ls.function_node
local fmt_ok, fmt_mod = pcall(require, "luasnip.extras.fmt")
if not fmt_ok then
  return {}
end
local fmta = fmt_mod.fmta

------------------------------------------------------------
-- Definição dos snippets
------------------------------------------------------------
local snippets = {
  s({ trig = "itemize", snippetType = "autosnippet", wordTrig = true },
    fmta([[
    \begin{itemize}
        \item <>
    \end{itemize}
    ]], { i(1) })
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

return snippets

