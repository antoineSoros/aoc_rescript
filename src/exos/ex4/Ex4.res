let fileToArray = ReadFile.fileToString("./src/exos/ex4/input4.txt")
type elfPair = {
  elf1: Belt.Set.Int.t,
  elf2: Belt.Set.Int.t,
}
let makeElfArrayFromFile = fileToArray => {
  fileToArray
  ->Js.String2.trim
  ->Js.String2.split("\n")
  ->Belt.Array.map(s =>
    s
    ->Js.String2.split(",")
    ->Belt.Array.map(s => s->Js.String2.split("-")->Belt.Array.map(s => s->Js.Float.fromString))
    ->Belt.Array.map(arr => {
      Belt.Array.range(arr[0]->Belt.Float.toInt, arr[1]->Belt.Float.toInt)
    })
  )
  ->Belt.Array.map(elfs => {
    let elf: elfPair = {
      elf1: Belt.Set.Int.fromArray(elfs[0]),
      elf2: Belt.Set.Int.fromArray(elfs[1]),
    }
    elf
  })
}
let isSubset = elfPair => {
  let elf1 = elfPair.elf1
  let elf2 = elfPair.elf2
  let elf1IsSubset = Belt.Set.Int.subset(elf1, elf2)
  let elf2IsSubset = Belt.Set.Int.subset(elf2, elf1)
  elf1IsSubset || elf2IsSubset
}
let solution1 = fileToArray => {
  let array = makeElfArrayFromFile(fileToArray)
  array->Belt.Array.reduce(0, (acc, elfPair) => {
    if isSubset(elfPair) {
      acc + 1
    } else {
      acc
    }
  })
}
let solution2 = fileToArray => {
  let array = makeElfArrayFromFile(fileToArray)
  array->Belt.Array.reduce(0, (acc, elfPair) => {
    let intersect =
      Belt.Set.Int.intersect(elfPair.elf1, elfPair.elf2)->Belt.Set.Int.toArray->Belt.Array.length
    if intersect == 0 {
      acc
    } else {
      acc + 1
    }
  })
}
let make = () => {
  LogSolution.make("4.1", solution1(fileToArray))
  LogSolution.make("4.2", solution2(fileToArray))
}
