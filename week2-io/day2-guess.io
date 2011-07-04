secret := (Random value * 100) ceil
guessed := false
try := 1
previousDistance := nil
loop (
  "Make an uneducated guess: " print
  guess := ReadLine readLine asNumber
  distance := (guess - secret) abs
  if (previousDistance != nil,
    if (distance < previousDistance, "Warmer..." println)
    if (distance > previousDistance, "Colder!" println)
  )
  if (guess == secret, guessed = true)
  if (try == 10 or guessed, break)
  previousDistance = distance
  try = try + 1
)
"End of game, you've " print
if (guessed, "won.", "lost. It was #{secret}." interpolate) println