let fileToArray =
  ReadFile.fileToString("./src/input1.txt")
  ->Js.String2.trim
  ->Js.String2.split("\n\n")
  ->Belt.Array.map(elf =>
    elf
    ->Js.String2.split("\n")
    ->Belt.Array.map(t => t->Js.Float.fromString)
    ->Belt.Array.reduce(0., (sum, v) => sum +. v)
  )

let solution1 = () => {
  let first = fileToArray->Belt.Array.reduce(0., (acc, value) => acc > value ? acc : value)

  LogSolution.make("1.1", first)
}
let solution2 = () => {
  let second =
    fileToArray
    ->Belt.Array.map(t => t->Belt.Int.fromFloat)
    ->Belt.SortArray.stableSortBy((a, b) => b - a)
    ->Belt.Array.slice(~offset=0, ~len=3)
    ->Belt.Array.reduce(0, (acc, value) => acc + value)
  LogSolution.make("1.2", second)
}
