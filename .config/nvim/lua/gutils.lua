function Dump(...)
    local objects = vim.tbl_map(vim.inspect, {...})
    print(unpack(objects))
end

