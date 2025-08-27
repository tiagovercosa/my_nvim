-- Snippets de notação bra-ket com detecção de math zone via Tree-sitter

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

-- Formata textos para que não tenham espaços em excesso
local function trim_spaces(args)
  local text = args[1][1] or ""
  return (text:gsub("%s+", " "))
end

-- Definição dos snippets
local snippets = {
  s({ trig = "ket", snippetType = "autosnippet", wordTrig = true },
    fmta("\\ket{<>}", { i(1, "\\psi") }),
    { condition = in_math }
  ),

  s({ trig = "bra", snippetType = "autosnippet", wordTrig = true },
    fmta("\\bra{<>}", { i(1, "\\psi") }),
    { condition = in_math }
  ),

  s({ trig = "brk", snippetType = "autosnippet", wordTrig = true },
    fmta("\\braket{<> | <>}", { i(1, "\\phi"), i(2, "\\psi") }),
    { condition = in_math }
  ),

  s({ trig = "bk", snippetType = "autosnippet", wordTrig = true },
    c(1, {
      fmta("\\bra{<>}\\ket{<>}", { i(1, "\\phi"), i(2, "\\psi") }),
      fmta("\\braket{<> | <>}", { i(1, "\\phi"), i(2, "\\psi") }),
    }),
    { condition = in_math }
  ),

  s({ trig = "expv", snippetType = "autosnippet", wordTrig = true },
    fmta("\\braket{<> | <> | <>}", { i(1, "\\psi"), i(2, "\\hat{O}"), i(3, "\\psi") }),
    { condition = in_math }
  ),

  s({ trig = "ip", snippetType = "autosnippet", wordTrig = true },
    fmta("\\langle <> \\mid <> \\rangle", { i(1, "\\phi"), i(2, "\\psi") }),
    { condition = in_math }
  ),

  s({ trig = "proj", snippetType = "autosnippet", wordTrig = true },
    fmta("\\ket{<>}\\bra{<>}", { i(1, "\\psi"), i(2, "\\psi") }),
    { condition = in_math }
  ),

  s({ trig = "norm", snippetType = "autosnippet", wordTrig = true },
    fmta("\\braket{<> | <>} = 1", { i(1, "\\psi"), i(2, "\\psi") }),
    { condition = in_math }
  ),

  s({ trig = "brcts", snippetType = "autosnippet", wordTrig = true },
    fmta("\\braket{<> | <>}", {
      f(trim_spaces, { 1 }),
      f(trim_spaces, { 2 }),
    }),
    { condition = in_math }
  ),
}

return snippets

