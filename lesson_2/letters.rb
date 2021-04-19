#Заполнить хеш гласными буквами, где значением будет являтся порядковый номер буквы в алфавите (a - 1).

letters = (:a..:z).to_a
numbers = (1..26).to_a
pair = Hash[letters.zip(numbers)];
pair.select { |key, value| key == :a || key == :e || key == :i || key == :o || key == :u || key == :y }