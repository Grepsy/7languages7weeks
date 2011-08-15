OperatorTable addAssignOperator(":", "colon")
curlyBrackets := method(
  r := Map clone
  call message arguments map(arg, r doMessage(arg))
  r
)
Map colon := method(
  #writeln("COLON ", call message arguments)
  self atPut(
    call evalArgAt(0) asMutable removePrefix("\"") removeSuffix("\""),
    call evalArgAt(1)
  )
)
Map asAttributes := method(
  s := ""
  self foreach(k, v, 
    s = "#{s}#{k}=\"#{v}\"" interpolate
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
    if (first type == "Map", 
      writeln(whitespace, "<#{tag} #{first asAttributes}>" interpolate),
      writeln(whitespace, "<#{tag}>" interpolate)
    )

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