// Generated by ReScript, PLEASE EDIT WITH CARE
'use strict';

var Ex2 = require("../src/exos/ex2/Ex2.bs.js");
var Jest = require("@glennsl/rescript-jest/src/jest.bs.js");
var ReadFile = require("../src/util/ReadFile.bs.js");

var fileToArray = ReadFile.fileToString("./src/exos/ex2/input_test.txt");

Jest.describe("Expect", (function (param) {
        Jest.test(" ex 2 part toBe equal to 15", (function (param) {
                return Jest.Expect.toBe(Jest.Expect.expect(Ex2.solution1(fileToArray)), 15);
              }));
        Jest.test(" ex 2 part 2 toBe equal to 12", (function (param) {
                return Jest.Expect.toBe(Jest.Expect.expect(Ex2.solution2(fileToArray)), 12);
              }));
      }));

exports.fileToArray = fileToArray;
/* fileToArray Not a pure module */
