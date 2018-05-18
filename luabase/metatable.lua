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

metademo.mytable4 = setmetatable({__index = function(mytable, key)
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

return metademo