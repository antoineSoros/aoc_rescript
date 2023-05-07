open Jest
let fileToArray = ReadFile.fileToString("./src/exos/ex3/input_test.txt")
describe("Expect", () => {
  open Expect

  test(" ex 3 part toBe equal to 157", () => expect(Ex3.solution1(fileToArray))->toBe(157))
  test(" ex 3 part 2 toBe equal to 70", () => expect(Ex3.solution2(fileToArray))->toBe(70))
})
