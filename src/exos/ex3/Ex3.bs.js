// Generated by ReScript, PLEASE EDIT WITH CARE
'use strict';

var ReadFile = require("../../util/ReadFile.bs.js");
var Belt_Array = require("rescript/lib/js/belt_Array.js");
var Caml_array = require("rescript/lib/js/caml_array.js");
var Belt_Option = require("rescript/lib/js/belt_Option.js");
var LogSolution = require("../../util/LogSolution.bs.js");

var fileToArray = ReadFile.fileToString("./src/input3.txt");

var alphaUp = Belt_Array.map(Belt_Array.map(Belt_Array.range(0, 25), (function (i) {
            return i + 65 | 0;
          })), (function (i) {
        return String.fromCharCode(i);
      }));

var alphaLow = Belt_Array.map(alphaUp, (function (ch) {
        return ch.toLowerCase();
      }));

function countValue($$char) {
  var index = Belt_Array.getIndexBy(alphaLow, (function (c) {
          return c === $$char;
        }));
  if (index !== undefined) {
    return index + 1 | 0;
  }
  var index$1 = Belt_Array.getIndexBy(alphaUp, (function (c) {
          return c === $$char;
        }));
  if (index$1 !== undefined) {
    return (index$1 + 1 | 0) + 26 | 0;
  } else {
    return 0;
  }
}

function solution1(param) {
  var ruckSacks = Belt_Array.map(fileToArray.trim().split("\n"), (function (s) {
          var length = s.length;
          var part1 = s.slice(0, length / 2 | 0);
          var part2 = s.slice(length / 2 | 0);
          return [
                  part1,
                  part2
                ];
        }));
  var sol = Belt_Array.reduce(Belt_Array.map(Belt_Array.map(ruckSacks, (function (ruck) {
                  var arr1 = Caml_array.get(ruck, 0).split("");
                  return Belt_Option.getWithDefault(Belt_Array.getBy(arr1, (function (ch) {
                                    return Caml_array.get(ruck, 1).includes(ch);
                                  })), "");
                })), countValue), 0, (function (acc, sum) {
          return acc + sum | 0;
        }));
  LogSolution.make("3.1", sol);
}

function solution2(param) {
  var stack = fileToArray.trim().split("\n");
  var i = 0;
  var newStack = [];
  while(i < stack.length) {
    var array = Belt_Array.slice(stack, i, 3);
    i = i + 3 | 0;
    newStack.push(array);
  };
  var sol = Belt_Array.reduce(Belt_Array.map(Belt_Array.map(newStack, (function (ruck) {
                  var arr1 = Caml_array.get(ruck, 0).split("");
                  return Belt_Option.getWithDefault(Belt_Array.getBy(arr1, (function (ch) {
                                    if (Caml_array.get(ruck, 1).includes(ch)) {
                                      return Caml_array.get(ruck, 2).includes(ch);
                                    } else {
                                      return false;
                                    }
                                  })), "");
                })), countValue), 0, (function (acc, sum) {
          return acc + sum | 0;
        }));
  LogSolution.make("3.2", sol);
}

exports.fileToArray = fileToArray;
exports.alphaUp = alphaUp;
exports.alphaLow = alphaLow;
exports.countValue = countValue;
exports.solution1 = solution1;
exports.solution2 = solution2;
/* fileToArray Not a pure module */
