"Fibonacci sequence (recursion)" println
Range // Include

fib := method(n,
  fibstep(1, 1, 1, n)
)
fibstep := method(a, b, s, n,
  if (s == n, b, fibstep(b, a + b, s + 1, n))
)
1 to(10) foreach(n, fib(n) println)

"Fibonacci sequence (loop)" println

fibl := method(n,
  a := 1
  b := 1
  for(c, 1, n,
    tmp := b
    b = a + b
    a = tmp
  )
  a
)
1 to(10) foreach(n, fibl(n) println)

"Change / to return 0 when using 0 denominator" println
//OperatorTable addOperator("/", 2)
Number olddiv := Number getSlot("/") clone
Number / := method(n,
  if (n == 0, 0, self olddiv(n))
)
(10/1) println

"Summing up numbers in a 2 dimensional array" println
List deepsum := method(
  sum := 0
  self foreach(i, sum = sum + i sum)
  sum
)
list(list(1,2,3), list(4,5,6), list(7,8,9)) deepsum println

"Averaging numbers in a list" println
List avg := method(
  self sum / self size
)
list(1, 20, 100) avg println

Matrix := Object clone
Matrix dim := method(x, y,
  self sizeX := x
  self sizeY := y
  self storage := List clone
  x repeat(self storage append(List clone setSize(y)))
  self
)
Matrix get := method(x, y, self storage at(x) at(y))
Matrix set := method(x, y, value, self storage at(x) atPut(y, value))
Matrix transpose := method(
  copy := Matrix clone dim(self sizeX, self sizeY)
  for (x, 0, self sizeX - 1,
    for (y, 0, self sizeY - 1,
      copy set(y, x, self get(x, y))
    )
  )
  copy
)
Matrix save := method(path,
  file := File open(path)
  for (x, 0, self sizeX - 1,
    for (y, 0, self sizeY - 1,
      file write(self get(x, y) asString .. ",")
    )
    file write("\n")
  )
)
Matrix load := method(path,
  file := File open(path)
  x := 0
  while (line := file readLine,
    storage atPut(x, line split(","))
    x = x + 1
  )
)

matrix := Matrix clone dim(4, 4)
matrix set(0, 0, 1)
matrix set(1, 0, 2)
matrix set(2, 0, 3)
matrix set(3, 0, 4)
matrix storage println
matrix save("matrix.dat")
matrix load("matrix.dat")
matrix storage println
matrix transpose storage println