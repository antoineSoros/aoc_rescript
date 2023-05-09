open Jest
let fileToArray = ReadFile.fileToString("./src/exos/ex4/input_test.txt")
describe("Expect", () => {
  open Expect

  test(" ex 4 part toBe equal to 2", () => expect(Ex4.solution1(fileToArray))->toBe(2))
})
