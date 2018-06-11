require("luabase/functiondemo")
require("luabase/metatable")
require("luabase/coroutinedemo")
require("luabase/oopdemo")
-- require("luabase/sqldemo")

print("-----------------function--------------------")
fundemo.sum(100, fundemo.add)
fundemo.sum(50, function(tol)
    print(tol)
end)
    
print("-----------------------------------------")
print(fundemo.NumToCN(234523))
    
print("-----------------------------------------")
local a = "23245023496830,汉字。。。。,asdqasdaqwe"
local b = ":"
b = fundemo.StrSplit(a,",")
print(b[2])
    
print("-----------------------------------------")
for i,n in fundemo.square,3,0
do
   print(i,n)
end
    
print("-----------------------------------------")
print(fundemo.ipairss({1,2,3,4,5}))
    
print("-----------------------------------------")
fundemo.getlen()

print(xpcall(
    fundemo.getlen,
    function(msg) 
        print(msg) 
    end)
)

print("-----------------metatable--------------------")
print(metademo.mytable.key1, metademo.mytable.key2, metademo.mytable.key3, metademo.mytable.key4)
print(metademo.mytable3.key1, metademo.mytable3.key2, metademo.mytable3.key3, metademo.mytable3.key4)
print(metademo.mytable3.key1, metademo.mytable3.key2, metademo.mytable3.key3, metademo.mytable3.key4)
metademo.addTable()
metademo.eqTable()

-- print("-----------------coroutine--------------------")

-- print("-----------------runCodemo--------------------")
-- codemo.runCodemo()

-- print("-----------------runCodemo2--------------------")
-- codemo.runCodemo2()

-- print("-----------------runCodemo3--------------------")
-- codemo.runCodemo3()

-- print("-----------------runCodemo4--------------------")
-- codemo.runCodemo4()

-- print("-----------------runCodemo5--------------------")
-- codemo.runCodemo5()


-- print("-----------------OOPDemo--------------------")
-- oopdemo.runDemo()

-- print("-----------------SQLDemo--------------------")
-- sqldemo.databaseTest()