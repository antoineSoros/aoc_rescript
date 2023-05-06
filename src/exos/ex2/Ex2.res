let fileToArray = ReadFile.fileToString("./src/input2.txt")
type game = Rock | Paper | Scissors
let stringToGagme = (s: string) => {
  switch s {
  | "X"
  | "A" =>
    Rock
  | "Y"
  | "B" =>
    Paper
  | "Z"
  | "C" =>
    Scissors
  | _ => Rock
  }
}
//state =>win =6,draw=3,loss=0
//play =>Rock=1,Paper=2,Scissors=3
//sum = state + me play
let countScore = (games: array<game>) => {
  let him = games[0]
  let me = games[1]
  switch (him, me) {
  | (Rock, Rock) => 4
  | (Rock, Paper) => 8
  | (Rock, Scissors) => 3
  | (Paper, Rock) => 1
  | (Paper, Paper) => 5
  | (Paper, Scissors) => 9
  | (Scissors, Rock) => 7
  | (Scissors, Paper) => 2
  | (Scissors, Scissors) => 6
  }
}
//Rock=>loose
//Paper=>draw
//Scissors=>win
let myPlay = (games: array<game>) => {
  switch (games[0], games[1]) {
  | (Rock, Rock) => [Rock, Scissors]
  | (Rock, Paper) => [Rock, Rock]
  | (Rock, Scissors) => [Rock, Paper]
  | (Paper, Rock) => [Paper, Rock]
  | (Paper, Paper) => [Paper, Paper]
  | (Paper, Scissors) => [Paper, Scissors]
  | (Scissors, Rock) => [Scissors, Paper]
  | (Scissors, Paper) => [Scissors, Scissors]
  | (Scissors, Scissors) => [Scissors, Rock]
  }
}
let makeArrayFromFile = () =>
  fileToArray
  ->Js.String2.trim
  ->Js.String2.split("\n")
  ->Belt.Array.map(s => s->Js.String2.split(" "))
  ->Belt.Array.map(s => s->Belt.Array.map(stringToGagme))
let solution1 = () => {
  let array = makeArrayFromFile()->Belt.Array.reduce(0, (acc, games) => acc + countScore(games))
  LogSolution.make("2.1", array)
}
let solution2 = () => {
  let array =
    makeArrayFromFile()
    ->Belt.Array.map(myPlay)
    ->Belt.Array.reduce(0, (acc, games) => acc + countScore(games))
  LogSolution.make("2.2", array)
}
