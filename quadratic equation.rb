puts "Введите 3 коэфициента a, b, c"
coefficient = gets.chomp
integer = coefficient.split.map(&:to_i)
a = integer[0]; 2
b = integer[1]; 3
c = integer[2]; 4
d = b**2 - 4*a*c
if d > 0 
    c = Math.sqrt(d)
    x1 = (-b + c)/(2*a)
    x2 = (-b - c)/(2*a)
puts "Дискриминант: #{d}"
puts "Корень1: #{x1.round(2)}"
puts "Корень2: #{x2.round(2)}"
elsif d == 0
    x1 = –b/(2*a)
    puts "Дискриминант: #{d}"
    puts "Корень: #{x1}"
else d < 0
    puts "Корней нет"
end