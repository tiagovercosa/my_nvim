local M               = {}

local ls              = require("luasnip")
local sn              = ls.snippet_node
local i               = ls.insert_node
local f               = ls.function_node
local s               = ls.snippet
local c               = ls.choice_node
local fmt_ok, fmt_mod = pcall(require, "luasnip.extras.fmt")

if not fmt_ok then
  return {}
end

local fmta = fmt_mod.fmta

function M.get_ISO_8601_date()
  return os.date("%Y-%m-%d")
end

function M.get_visual(args, parent)
  if (#parent.snippet.env.LS_SELECT_RAW > 0) then
    return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
  else
    return sn(nil, i(1, ''))
  end
end

return M
