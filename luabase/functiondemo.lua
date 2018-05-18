--
-- Created by IntelliJ IDEA.
-- User: Administrator
-- Date: 2018-05-16
-- Time: 下午 02:49
-- To change this template use File | Settings | File Templates.
--
fundemo = {}

function fundemo.sum(limit, funpara)
    local tol = 0
    for i = 0, limit
    do
        tol = tol + i
    end
    funpara(tol)
end

function fundemo.add(sum)
    print(sum)
end


function fundemo.getlen()
    tab = {}
    tab[1] = "1"
    tab[2] = "2"
    tab[3] = "3"
    tab[4] = "4"
    tab[5] = "5"
    print("tab长度" .. #tab)
    str = string.match("I have 2 questions for you.", "%d+ %a+")
    print(str)
end

function fundemo.NumToCN(num) --阿拉伯数字转换成中文数字
    local size = #tostring(num)
    local CN = ""
    local StrCN = {"一","二","三","四","五","六","七","八","九"}
    for i = 1 , size do
        CN = CN .. StrCN[tonumber(string.sub(tostring(num), i , i))]
    end
    return CN
end

function fundemo.StrSplit(inputstr, sep) --根据传入字符分割 seq
    if sep == nil then
      sep = "%s"
    end
    local t={}
    local i=1
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
       t[i] = str
       i = i + 1
    end
    return t
end

--数组
function fundemo.arraydemo()
    array = {"Java","Lua", "Tutorial"}
    for key,value in pairs(array) do
        print(value)
    end

    array = {}
    for i= -2, 2 do
    array[i] = -i *2
    end
    for k,v in pairs(array) do
        print(k,v)
    end
end

function fundemo.square(iteratorMaxCount,currentNumber)
    if currentNumber<iteratorMaxCount
    then
       currentNumber = currentNumber+1
    return currentNumber, currentNumber*currentNumber
    end
 end

 function fundemo.iter (a, i)
    i = i + 1
    local v = a[i]
    if v then
       return i, v
    end
end
 
function fundemo.ipairss (a)
    return iter, a, 0
end

return fundemo