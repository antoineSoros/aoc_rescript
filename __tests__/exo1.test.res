open Jest

let fileToArray =
  ReadFile.fileToString("./src/exos/ex1/input_test.txt")
  ->Js.String2.trim
  ->Js.String2.split("\n\n")
  ->Belt.Array.map(elf =>
    elf
    ->Js.String2.split("\n")
    ->Belt.Array.map(t => t->Js.Float.fromString)
    ->Belt.Array.reduce(0., (sum, v) => sum +. v)
  )

describe("Expect", () => {
  open Expect

  test(" ex 1 part toBe equal to 24000", () => expect(Ex1.solution1(fileToArray))->toBe(24000.))
  test(" ex 1 part 2 toBe equal to 45000", () => expect(Ex1.solution2(fileToArray))->toBe(45000))
})
