shopping_cart = {}
sum = 0
loop do 
  puts 'Enter product name or enter stop to finish process'
  product_name = gets.chomp
  break if product_name == 'stop'
  puts 'Enter price:'
  product_price = gets.to_f
  puts 'Enter quantity'
  product_quantity = gets.to_f
  shopping_cart[product_name] = { "price" => product_price, "quantity" => product_quantity, "cost" => product_quantity * product_price }
  puts "Item: #{product_name}, price: #{shopping_cart[product_name]['price']}, quantity: #{shopping_cart[product_name]['quantity']}, cost: #{shopping_cart[product_name]['quantity'] * shopping_cart[product_name]['price']}"
end
shopping_cart.each { |key, value| sum += value['cost']}
puts "Total: #{sum}"