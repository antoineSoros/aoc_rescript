open Jest
let fileToArray = ReadFile.fileToString("./src/exos/ex2/input_test.txt")
describe("Expect", () => {
  open Expect

  test(" ex 2 part toBe equal to 15", () => expect(Ex2.solution1(fileToArray))->toBe(15))
  test(" ex 2 part 2 toBe equal to 12", () => expect(Ex2.solution2(fileToArray))->toBe(12))
})
