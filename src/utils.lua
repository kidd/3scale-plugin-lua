function table.delete(table, key)
    local element = table[key]
    table[key] = nil
    return element
end
