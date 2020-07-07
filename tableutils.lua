package.path = "/home/dyre/Workspace/playground/lua-split/src/" .. "?.lua;" .. package.path
split = require "split"

local tableutils = {}

function tableutils.isTable(value)
   return type(value) == "table"
end

function tableutils.isCsv(value)
    if (not(type(value) == "string")) then
        return false
    end

    if (not value:find(',')) then
        return false
    end

    return true
end

function tableutils.valueExist(searchValue, table)
    for index, value in ipairs(table) do
        if (value == searchValue) then
            return true
        end
    end
    return false
end

function tableutils.valuesIntersect(table1, table2)
    for index, value in ipairs(table1) do
        if (tableutils.valueExist(value, table2)) then
            return true
        end
    end
    return false
end

function tableutils.isValuesSubsetOf(table1, table2)
    for index1, value1 in ipairs(table1) do
        if (not tableutils.valueExist(value1, table2)) then
            return false
        end
    end
    return true
end

function tableutils.isValuesMatch(table1, table2)
    return tableutils.isValuesSubsetOf(table1, table2) and tableutils.isValuesSubsetOf(table2, table1)
end

function tableutils.keyValueExist(searchIndex, searchValue, table)
    for index, value in ipairs(table) do
        if (index == searchIndex and value == searchValue) then
            return true
        end
    end
    return false
end

function tableutils.isKeyValueSubsetOf(table1, table2)
    for index1, value1 in ipairs(table1) do
        if (not tableutils.keyValueExist(index1, value1, table2)) then
            return false
        end
    end
    return true
end

function tableutils.isKeyValuesMatch(table1, table2)
    return tableutils.isKeyValueSubsetOf(table1, table2) and tableutils.isKeyValueSubsetOf(table2, table1)
end


return tableutils