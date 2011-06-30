puts 'Usage: <file> <needle>' if ARGV.size < 2
file = File.open(ARGV[0], 'r')
file.lines.each do |line|
  printf "%6d: %s", file.lineno, line if line.include? ARGV[1]
end