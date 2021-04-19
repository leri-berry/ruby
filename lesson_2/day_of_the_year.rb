#Заданы три числа, которые обозначают число, месяц, год (запрашиваем у пользователя). 
#Найти порядковый номер даты, начиная отсчет с начала года. Учесть, что год может быть високосным.

puts 'Enter day'
day = gets.to_i
puts 'Enter month'
month = gets.to_i
puts 'Enter year'
year = gets.to_i

months_and_days = {
  '1' => 31,
  '2' => 28,
  '3' => 31,
  '4' => 30,
  '5' => 31,
  '6' => 30,
  '7' => 31,
  '8' => 31,
  '9' => 30,
  '10' => 31,
  '11' => 30,
  '12' => 31
}

if month == 1
  puts day
elsif month >= 2
  month_days = months_and_days.select { |m, d| m.to_i < month }.values.reduce(:+)
  year/4 == 0 || year/400 == 0
  puts month_days + day
else
  leap_year = month_days + day + 1
  puts leap_year
end