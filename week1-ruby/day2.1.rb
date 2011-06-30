numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9 ,10 , 11, 12, 13, 14, 15,16]
numbers.each do |i| 
  print i
  puts "\n" if i % 4 == 0
end

numbers.each_slice(4) { |s| p s }