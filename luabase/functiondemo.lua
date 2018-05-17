--
-- Created by IntelliJ IDEA.
-- User: Administrator
-- Date: 2018-05-16
-- Time: 下午 02:49
-- To change this template use File | Settings | File Templates.
--

function sum(limit, funpara)
    local tol = 0
    for i = 0, limit
    do
        tol = tol + i
    end
    funpara(tol)
end

function add(sum)
    print(sum)
end

sum(100, add)
sum(50, function(tol)
    print(tol)
end)

print("-----------------------------------------")
tab = {}
tab[1] = "1"
tab[2] = "2"
tab[3] = "3"
tab[4] = "4"
tab[5] = "5"
print("tab长度" .. #tab)

str = string.match("I have 2 questions for you.", "%d+ %a+")
print(str)

print("-----------------------------------------")
local function NumToCN(num) --阿拉伯数字转换成中文数字
    local size = #tostring(num)
    local CN = ""
    local StrCN = {"一","二","三","四","五","六","七","八","九"}
    for i = 1 , size do
        CN = CN .. StrCN[tonumber(string.sub(tostring(num), i , i))]
    end
    return CN
end
print(NumToCN(234523))

print("-----------------------------------------")
function StrSplit(inputstr, sep) --根据传入字符分割 seq
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
local a = "23245023496830,汉字。。。。,asdqasdaqwe"
local b = ":"
b = StrSplit(a,",")
print(b[2])

print("-----------------------------------------")
--数组
array = {"Java","Lua", "Tutorial"}
for key,value in pairs(array) do
    print(value)
end

print("-----------------------------------------")
array = {}
for i= -2, 2 do
   array[i] = -i *2
end
for k,v in pairs(array) do
    print(k,v)
end

print("-----------------------------------------")
function square(iteratorMaxCount,currentNumber)
    if currentNumber<iteratorMaxCount
    then
       currentNumber = currentNumber+1
    return currentNumber, currentNumber*currentNumber
    end
 end
 
 for i,n in square,3,0
 do
    print(i,n)
 end

 print("-----------------------------------------")
 function iter (a, i)
    i = i + 1
    local v = a[i]
    if v then
       return i, v
    end
end
 
function ipairss (a)
    return iter, a, 0
end

print(ipairss({1,2,3,4,5}))