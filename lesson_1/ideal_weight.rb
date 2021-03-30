puts 'What is your name?'
name = gets.chomp
puts 'What is your height?'
height = gets.chomp
ideal_weight = (height.to_i - 110)*1.15
if ideal_weight < 0 
puts "#{name}, your weight is already optimal"
else 
puts "#{name}, your ideal weight is #{ideal_weight.round(1)}"
end