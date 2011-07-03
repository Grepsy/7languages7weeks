// Is Io strongly or weakly typed?

1+1
number := 3
writeln("value: #{number} type: #{number type}" interpolate)
number = "five"
writeln("value: #{number} type: #{number type}" interpolate)

// True and falsyness

writeln(0 == true)
writeln("" == true)
writeln(nil == true)

// What slots does a prototype support?

testProto := Object clone
testProto slotNames println
testProto proto slotNames println

// Operators

// := creation and assignment
io := "cool"
// = assignment
io = "the bees knees"
// ::= assignment, create setter
pen := Object clone
pen color ::= "red"
pen setColor("blue")