codemo = {}
-- coroutine_test.lua 文件
function codemo.runCodemo()
    co = coroutine.create(
        function(i)
            print(i);
        end
    )
    
    coroutine.resume(co, 1)   -- 1
    print(coroutine.status(co))  -- dead
    
    print("----------")
    
    co = coroutine.wrap(
        function(i)
            print(i);
        end
    )
    
    co(1)
    
    print("----------")
    
    co2 = coroutine.create(
        function()
            for i=1,10 do
                print(i)
                if i == 3 then
                    print(coroutine.status(co2))  --running
                    print(coroutine.running()) --thread:XXXXXX
                elseif i == 10 then
                    print(coroutine.status(co2))  --running
                    print(coroutine.running()) --thread:XXXXXX
                end
                coroutine.yield()
            end
        end
    )
    
    coroutine.resume(co2) --1
    coroutine.resume(co2) --2
    coroutine.resume(co2) --3
    coroutine.resume(co2) --4
    coroutine.resume(co2) --5
    coroutine.resume(co2) --6
    coroutine.resume(co2) --7
    coroutine.resume(co2) --8
    coroutine.resume(co2) --9
    coroutine.resume(co2) --10
    coroutine.resume(co2) --11
    print(coroutine.status(co2))   -- suspended
    print(coroutine.running())
    
    print("----------")
end


local function foo (a)
    print("foo 函数输出", a)
    return coroutine.yield(2 * a) -- 返回  2*a 的值
end

function codemo.runCodemo2()
    co = coroutine.create(function (a , b)
        print("第一次协同程序执行输出", a, b) -- co-body 1 10
        local r = foo(a + 1)
        
        print("第二次协同程序执行输出", r)
        local r, s = coroutine.yield(a + b, a - b)  -- a，b的值为第一次调用协同程序时传入
        
        print("第三次协同程序执行输出", r, s)
        return b, "结束协同程序"                   -- b的值为第二次调用协同程序时传入
    end)
            
    print("main", coroutine.resume(co, 1, 10)) -- true, 4
    print("--分割线----")
    print("main", coroutine.resume(co, "r")) -- true 11 -9
    print("---分割线---")
    print("main", coroutine.resume(co, "x", "y")) -- true 10 end
    print("---分割线---")
    print("main", coroutine.resume(co, "x", "y")) -- cannot resume dead coroutine
    print("---分割线---")
end


function codemo.runCodemo3()
    handle = coroutine.create(function (arg1,arge2)  
        local start = 0  
        
        print(arg1,arg2)  
        
        while true do  
          if( start == 0 or start == 20) then  
            print("yield arg is :",coroutine.yield(arg .. "me",arg2+1))  
            print("back to",start)  
          end  
        
          if start == 30 then  
            break  
          end  
        
          start = start + 1  
          print("it is first coroutine istance")  
        end  
        
        return "coroutine is over"  
        
      end)  
        
      print(coroutine.resume(handle,"test",1999))
      print(coroutine.resume(handle,"ooo",33))  
      print(coroutine.resume(handle,"111",77))
      print(coroutine.resume(handle,"jjj",55))
    end



function codemo.runCodemo4()
    co = coroutine.create(function()
        local current = coroutine.running
        coroutine.yield(current)
        first(function()
            second(function()
                coroutine.yield(current)
                print("second")
            end)
        end)
    end)
    print("runCodemo4")
    coroutine.resume(co)
    coroutine.resume(co)
    coroutine.resume(co)
    coroutine.resume(co)
end
    
function first(cb1)
    print("say first before")
    cb1()
    print("say first after")
end

function second(cb2)
    print("say second before")
    cb2()
    print("say second after")
end


---------------生产者与消费者问题-----------------
local newProductor

function productor()
    local i = 0
    while true do
        i = i + 1
        print(coroutine.status(newProductor))
        send(i)     -- 将生产的物品发送给消费者
        print(coroutine.status(newProductor))
    end
end

function consumer()
    while true do
        local i = receive()     -- 从生产者那里得到物品
        if (i==100) then
            break
        end
        print(i)
    end
end

function receive()
    print(coroutine.status(newProductor))
    local status, value = coroutine.resume(newProductor)
    print(coroutine.status(newProductor))
    return value
end

function send(x)
    print(coroutine.status(newProductor))
    coroutine.yield(x)     -- x表示需要发送的值，值返回以后，就挂起该协同程序
    print(coroutine.status(newProductor))
end

-- 启动程序
function codemo.runCodemo5()
    newProductor = coroutine.create(productor)
    consumer()
end