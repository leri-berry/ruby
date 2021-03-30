puts 'To calculate square of the triangle enter height and base'
puts 'Enter the height of the triangle'
triangle_height = gets.chomp
puts 'Enter the base of the triangle'
triangle_base = gets.chomp
triangle_square = 1/2*triangle_height.to_i*triangle_base.to_i
puts "Square of the triangle is #{triangle_square}"