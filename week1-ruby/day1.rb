# Print the string Hello World

puts "Hello, World"

# Find index "Ruby" in "Hello Ruby"

"Hello, Ruby.".index("Ruby")

# Print your name 10 times

10.times { puts "Robert" }

# Print the string "This is sentence number 1" changing the number

i = 1
while i < 11 do
  puts "This is sentence number #{i}."
  i = i + 1
end

# Bonus problem

secret = rand(10) + 1
victory = false
puts "Guess the number between 1 and 10"
until victory do
  guess = gets.to_i
  puts "Too low" if guess < secret
  puts "Too high" if guess > secret
  victory = guess == secret
end