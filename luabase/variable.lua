--
-- Created by IntelliJ IDEA.
-- User: Administrator
-- Date: 2018-05-16
-- Time: 下午 02:07
-- To change this template use File | Settings | File Templates.
--

a = 5 -- 全局变量
local b = 5 -- 局部变量

function joke()
    c = 5 -- 全局变量
    local d = 6 -- 局部变量
end

joke()
print(c, d) --> 5 nil

do
    local a = 6 -- 局部变量
    b = 6 -- 对局部变量重新赋值
    print(a, b); --> 6 6
end

print(a, b) --> 5 6

function f(x)
    print("function")
    return x * 2
end

for i = 1, f(10), 1 do print(i)
end

days = { seven = "Sunday", one = "Monday", two = "Tuesday", three = "Wednesday", four = "Thursday", five = "Friday", six = "Saturday" }
for i, v in pairs(days) do print(i, v) end