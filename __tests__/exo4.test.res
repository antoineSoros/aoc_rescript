open Jest
let fileToArray = ReadFile.fileToString("./src/exos/ex4/input_test.txt")
describe("Expect", () => {
  open Expect

  test(" ex 4 part 1 toBe equal to 2", () => expect(Ex4.solution1(fileToArray))->toBe(2))
  test(" ex 4 part 2 toBe equal to 4", () => expect(Ex4.solution2(fileToArray))->toBe(4))
})
