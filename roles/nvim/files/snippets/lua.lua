local ls = require("luasnip")
local s = ls.s
local i = ls.i
local t = ls.t

local d = ls.dynamic_node
local c = ls.choice_node
local f = ls.function_node
local sn = ls.snippet_node

local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

local snippets, autosnippets = {}, {}

local group = vim.api.nvim_create_augroup("Lua Snippets", { clear = true })
local file_pattern = "*.lua"


-- Start


local req = s({
    trig = "req ([%w_]+)",
    regTrig = true,
}, fmt([[
    local {} = require('{}')

]], {
    d(1, function(_, snip)
        return sn(1, i(1, snip.captures[1]))
    end),
    d(2, function(_, snip)
        return sn(1, i(1, snip.captures[1]))
    end),
}))


local inlineFunc = s("fni", fmt([[
    function({}) {} end
]], {
    i(1, ""),
    i(2, "--[[ TODO --]]"),
}))


local anonymousFunc = s("fn", fmt([[
    function({})
        {}
    end
]], {
    i(1, ""),
    i(2, "-- TODO"),
}))


local localFunc = s({
    trig = "fnl ([%w_]+)",
    regTrig = true,
}, fmt([[
    local {} = function({})
        {}
    end


]], {
    d(1, function(_, snip)
        return sn(1, i(1, snip.captures[1]))
    end),
    i(2, ""),
    i(3, "-- TODO: implement"),
}))


local moduleFunc = s({
    trig = "fnm ([%w_]+)",
    regTrig = true,
}, fmt([[
    M.{} = function({})
        {}
    end


]], {
    d(1, function(_, snip)
        return sn(1, i(1, snip.captures[1]))
    end),
    i(2, ""),
    i(3, "-- TODO: implement"),
}))


table.insert(snippets, req)
table.insert(snippets, inlineFunc)
table.insert(snippets, anonymousFunc)
table.insert(snippets, localFunc)
table.insert(snippets, moduleFunc)

-- End





return snippets, autosnippets
