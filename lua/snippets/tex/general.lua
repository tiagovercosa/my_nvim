-- Snippets de notação geral usado para escrita de texto detecção de math zone via Tree-sitter

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

-- Detecção ambiente matemático
local function in_math_vimtex()
  if vim.bo.filetype ~= "tex" then return false end
  -- Checa se a função vimtex#syntax#in_mathzone existe e pode ser chamada
  local ok, res = pcall(function()
    return vim.fn['vimtex#syntax#in_mathzone']() == 1
  end)
  return ok and res
end

local function in_math()
  return in_math_vimtex()
end

------------------------------------------------------------
-- Definição dos snippets
------------------------------------------------------------
local snippets = {
  s({ trig = "bf", snippetType = "autosnippet", wordTrig = true },
    fmta("\\textbf{<>} ", { i(1) }),
    { condition = not in_math }
  ),

  s({ trig = "iit", snippetType = "autosnippet", wordTrig = true },
    fmta("\\textit{<>} ", { i(1) }),
    { condition = not in_math }
  ),

  s({ trig = "bf", snippetType = "autosnippet", wordTrig = true },
    fmta("\\bm{<>} ", { i(1) }),
    { condition = in_math }
  ),

}

return snippets

