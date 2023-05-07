let alphaUp =
  Belt.Array.range(0, 25)
  ->Belt.Array.map(i => i + 65)
  ->Belt.Array.map(i => Js.String.fromCharCode(i))
let alphaLow = alphaUp->Belt.Array.map(ch => ch->Js.String2.toLowerCase)
let countValue = char => {
  switch alphaLow->Belt.Array.getIndexBy(c => c === char) {
  | Some(index) => index + 1
  | None =>
    switch alphaUp->Belt.Array.getIndexBy(c => c === char) {
    | Some(index) => index + 1 + 26
    | None => 0
    }
  }
}
let solution1 = fileToArray => {
  let ruckSacks =
    fileToArray
    ->Js.String2.trim
    ->Js.String2.split("\n")
    ->Belt.Array.map(s => {
      let length = s->Js.String2.length
      let part1 = s->Js.String2.slice(~from=0, ~to_=length / 2)
      let part2 = s->Js.String2.sliceToEnd(~from=length / 2)
      [part1, part2]
    })

  ruckSacks
  ->Belt.Array.map(ruck => {
    let arr1 = ruck[0]->Js.String2.split("")
    arr1->Belt.Array.getBy(ch => ruck[1]->Js.String2.includes(ch))->Belt.Option.getWithDefault("")
  })
  ->Belt.Array.map(countValue)
  ->Belt.Array.reduce(0, (acc, sum) => acc + sum)
}
let solution2 = fileToArray => {
  let stack = fileToArray->Js.String2.trim->Js.String2.split("\n")
  let length = 3
  let i = ref(0)
  let newStack = []
  while i.contents < stack->Belt.Array.length {
    let array = stack->Belt.Array.slice(~offset=i.contents, ~len=length)
    i := i.contents + 3
    Js.Array2.push(newStack, array)->ignore
  }

  newStack
  ->Belt.Array.map(ruck => {
    let arr1 = ruck[0]->Js.String2.split("")
    arr1
    ->Belt.Array.getBy(ch => ruck[1]->Js.String2.includes(ch) && ruck[2]->Js.String2.includes(ch))
    ->Belt.Option.getWithDefault("")
  })
  ->Belt.Array.map(countValue)
  ->Belt.Array.reduce(0, (acc, sum) => acc + sum)
}
let fileToArray = ReadFile.fileToString("./src/exos/ex3/input3.txt")
let make = () => {
  LogSolution.make("3.1", solution1(fileToArray))
  LogSolution.make("3.2", solution2(fileToArray))
}
