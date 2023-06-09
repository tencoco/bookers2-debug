def Fizz_Buzz(number)
  if number % 15 == 0
      puts "Fizz_Buzz"
  elsif number % 3 == 0
      puts "Fizz"
  elsif number % 5 == 0
    puts "Buzz"
  else
    puts number.to_s
  end
end

puts "数字を入力してください"

input = gets.to_i

puts "結果は..."

puts Fizz_Buzz(input)