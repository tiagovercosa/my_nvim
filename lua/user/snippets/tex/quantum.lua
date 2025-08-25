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

------------------------------------------------------------
-- Detecção via Tree-sitter
------------------------------------------------------------
local function in_math_treesitter()
  if vim.bo.filetype ~= "tex" then return false end
  local ok_parser, parser = pcall(vim.treesitter.get_parser, 0, "latex")
  if not ok_parser or not parser then
    return false
  end

  local ts_utils_ok, ts_utils = pcall(require, "nvim-treesitter.ts_utils")
  if not ts_utils_ok then
    return false
  end

  local node = ts_utils.get_node_at_cursor()
  if not node then return false end

  -- Para evitar loops em arquivos muito grandes, limite profundidade
  local depth = 0
  while node and depth < 60 do
    depth = depth + 1
    local t = node:type()

    -- Ajuste a lista conforme os nomes reais da sua gramática.
    if
      t == "inline_formula" or
      t == "displayed_formula" or
      t == "inline_math" or
      t == "displayed_math" or
      t == "math_environment" or
      t == "math_mode" or
      t == "generic_math_environment"
    then
      return true
    end

    node = node:parent()
  end

  return false
end

local function in_math()
  return in_math_treesitter()
end

------------------------------------------------------------
-- Utilidades de formatação de snippet
------------------------------------------------------------
local function trim_spaces(args)
  local text = args[1][1] or ""
  return (text:gsub("%s+", " "))
end

------------------------------------------------------------
-- Definição dos snippets
------------------------------------------------------------
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

