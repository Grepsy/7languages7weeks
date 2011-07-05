OperatorTable addAssignOperator(":", "colon")
curlyBrackets := method(
  r := Map clone
  call message arguments map(arg, r doMessage(arg))
  r
)
Map colon := method(
  self atPut(
    call evalArgAt(0) asMutable removePrefix("\"") removeSuffix("\"")
    call evalArgAt(1)
  )
)
Map asAttributes := method(
  s := ""
  self foreach(k, v, 
    writeln(k, ":", v)
    s = s .. k "=\"" .. v .. "\" "
  )
  s
)

Builder := Object clone
Builder do(
  level := 0
 
  whitespace := method(" " repeated(self level * 4))
 
  forward := method(
    tag := call message name
    first := call evalArgAt(0)
    if (first type == "Map", attributes := first)
    attributes asAttributes println  
    writeln(whitespace, "<#{tag}#{?attributes asAttributes}>" interpolate)
    call message arguments foreach(arg,
      self level = self level + 1
      content := self doMessage(arg)
      if (content type == "Sequence", writeln(whitespace, content))
      self level = self level - 1
    )
    writeln(whitespace, "</#{tag}>" interpolate)
  )
)
doFile("dsl.io")