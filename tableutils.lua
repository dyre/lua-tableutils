local tableutils = {}

function tableutils.isTable(value)
   return type(value) == "table"
end

function tableutils.find(searchIndex, searchValue, table)
    for index, value in ipairs(table) do
        if (index == searchIndex and value == searchValue) then
            return true
        end
    end
    return false
end

function tableutils.subsetOf(table1, table2)
    for index1, value1 in ipairs(table1) do
        if (not tableutils.find(index1, value1, table2)) then
            return false
        end
    end
    return true
end

function tableutils.matches(table1, table2)
    return tableutils.subsetOf(table1, table2) and tableutils.subsetOf(table2, table1)
end

return tableutils