local awful = require("awful")

local M = {}

local parse_mods = function(mods)
    local result = {}

    local mods_map = {
        m = modkey,
        a = 'Alt',
        c = 'Ctrl',
        s = 'Shift',
    }

    for mod_alias in mods:gmatch "." do
        table.insert(result, mods_map[mod_alias])
    end

    return result
end

M.create_keybinding_builder = function(group)
    return function(mods, key, description, action)
        return awful.key(parse_mods(mods), key, action, {
            description = description,
            group = group
        })
    end
end

M.spawn = function(command)
    return function()
        awful.spawn(command)
    end
end

M.spawn_with_shell = function(command)
    return function()
        awful.spawn.with_shell(command)
    end
end

return M
