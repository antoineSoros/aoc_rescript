// Generated by ReScript, PLEASE EDIT WITH CARE
'use strict';

var Ex3 = require("../src/exos/ex3/Ex3.bs.js");
var Jest = require("@glennsl/rescript-jest/src/jest.bs.js");
var ReadFile = require("../src/util/ReadFile.bs.js");

var fileToArray = ReadFile.fileToString("./src/exos/ex3/input_test.txt");

Jest.describe("Expect", (function (param) {
        Jest.test(" ex 3 part toBe equal to 157", (function (param) {
                return Jest.Expect.toBe(Jest.Expect.expect(Ex3.solution1(fileToArray)), 157);
              }));
        Jest.test(" ex 3 part 2 toBe equal to 70", (function (param) {
                return Jest.Expect.toBe(Jest.Expect.expect(Ex3.solution2(fileToArray)), 70);
              }));
      }));

exports.fileToArray = fileToArray;
/* fileToArray Not a pure module */
