puts 'What is your name?'
name = gets.chomp
puts 'What is your height?'
height = gets.to_i
ideal_weight = (height - 110)*1.15
if ideal_weight < 0 
  puts "#{name}, your weight is already optimal"
else
  puts "#{name}, your ideal weight is #{ideal_weight.round(1)}"
end