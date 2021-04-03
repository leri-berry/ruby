puts 'Enter 3 side of the triangle'
sides = gets.chomp
integer_array = sides.split.map(&:to_i).sort
if integer_array[2]**2 == integer_array[0]**2 + integer_array[1]**2
  puts 'Tringle is right'
  elsif integer_array[0] == integer_array[1] && integer_array[1] == integer_array[2] && integer_array[2] == integer_array[0]
    puts 'Triangle is equilateral'
    elsif integer_array[0] == integer_array[1] || integer_array[1] == integer_array[2] || integer_array[2] == integer_array[0]
      puts 'Triangle is isosceles'
    else
      puts 'Triangle is not defined'
    end