# Create a list syntax that uses brackets
squareBrackets := method(
  call message arguments map(arg, self doMessage(arg))
)
["green", "blue", ["purple", "yellow", ["pink"]]] println

