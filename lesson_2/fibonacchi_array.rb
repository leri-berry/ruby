#Заполнить массив числами фибоначчи до 100

fibonacci_numbers = [0, 1]
element = 1

while element < 100
	fibonacci_numbers << element
	element = fibonacci_numbers[-2] + fibonacci_numbers[-1]
end

puts fibonacci_numbers

