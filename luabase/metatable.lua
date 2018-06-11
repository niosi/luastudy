metademo = {}

metademo.mytable = setmetatable({key1 = "value1", key4 = "value4"}, {
    __index = function(mytable, key)
      if key == "key2" then
        return "value2"
      else
        return "value3"
      end
    end
})

metademo.mytable2 = setmetatable({key1 = "value1", key4 = "value4"}, {
    __index = {key2 = "value2",key3 = "value3"}}
)

metademo.mytable3 = setmetatable({__index = function(mytable, key)
    if key == "key1" then
        return "value1"
    elseif key == "key4" then
        return "value4"
    else
        return nil
    end
end
}, {
    __index = function(mytable, key)
        if key == "key2" then
            return "value2"
        elseif key == "key3" then
            return "value3"
        else
            return mytable.__index(mytable,key)
        end
    end
})


-- 计算表中最大值，table.maxn在Lua5.2以上版本中已无法使用
-- 自定义计算表中最大键值函数 table_maxn，即计算表的元素个数
function table_maxn(t)
    local mn = 0
    for k, v in pairs(t) do
        if mn < k then
            mn = k
        end
    end
    return mn
end

-- 两表相加操作
mytable4 = setmetatable({ 1, 2, 3 }, {
  __add = function(mytable, newtable)
    for i = 1, table_maxn(newtable) do
      table.insert(mytable, table_maxn(mytable)+1,newtable[i])
    end
    return mytable
  end
})

secondtable = {4,5,6}
thirdtable = {1,2,3}

function metademo.addTable()
    mytable4 = mytable4 + secondtable
        for k,v in ipairs(mytable4) do
    print(k,v)
    end
end

mytable5 = setmetatable({1,2,3},{
    __eq = function(mytable, newtable)
        if table_maxn(mytable) ~= table_maxn(newtable) then
            print("Fail")
            return false
        end
        for i=1, table_maxn(newtable) do
            if(newtable[i]~=mytable[i]) then
                print("Fail")
                return false
            end
        end
        print("Succ")
        return true
    end
})

function metademo.eqTable()
    print(secondtable==mytable5)
    print(mytable5==thirdtable)
end

return metademo