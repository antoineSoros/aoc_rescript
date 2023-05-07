// Generated by ReScript, PLEASE EDIT WITH CARE
'use strict';

var Ex1 = require("../src/exos/ex1/Ex1.bs.js");
var Jest = require("@glennsl/rescript-jest/src/jest.bs.js");
var ReadFile = require("../src/util/ReadFile.bs.js");
var Belt_Array = require("rescript/lib/js/belt_Array.js");

var fileToArray = Belt_Array.map(ReadFile.fileToString("./src/exos/ex1/input_test.txt").trim().split("\n\n"), (function (elf) {
        return Belt_Array.reduce(Belt_Array.map(elf.split("\n"), (function (t) {
                          return Number(t);
                        })), 0, (function (sum, v) {
                      return sum + v;
                    }));
      }));

Jest.describe("Expect", (function (param) {
        Jest.test(" ex 1 part toBe equal to 24000", (function (param) {
                return Jest.Expect.toBe(Jest.Expect.expect(Ex1.solution1(fileToArray)), 24000);
              }));
        Jest.test(" ex 1 part 2 toBe equal to 45000", (function (param) {
                return Jest.Expect.toBe(Jest.Expect.expect(Ex1.solution2(fileToArray)), 45000);
              }));
      }));

exports.fileToArray = fileToArray;
/* fileToArray Not a pure module */
