"use strict";

var range = function (start, end) {
  var result = [];
  if (start === end) {
    return [start];
  }else if (start > end) {
    return [];
  }
  result.push(start);
  return result.concat(range(start+1, end));
};



var exponentiation = function (base, exponent) {
  if (exponent === 0) {
    return 1;
  } else {
    return base * exponentiation(base, exponent - 1);
  }
};

var expo2 = function (base, n) {
  if (n === 0) {
    return 1;
  } else if (n === 1) {
    return base;
  } else if (n % 2 === 0) {
    var temp = expo2(base, n/2);
    return temp * temp;
  } else {
    var temp2 = expo2(base, (n - 1) / 2);
    return base * temp2 * temp2;
  }
};

var sum = function (array) {
  if (array.length === 1) {
    return array[0];
  }else {
    return array.pop() + sum(array);
  }
};
var fibo = function (n) {
  var resultArray = [];
  if (n === 0) {
    return resultArray;
  } else if (n === 1) {
    resultArray = [0];
    return resultArray;
  } else if (n === 2) {
    resultArray = [0,1];
    return resultArray;
  } else {
    resultArray = resultArray.concat(fibo(n - 1));
    var lastTwo = resultArray.slice(-2);
    var sumOfLastTwo = lastTwo[0] + lastTwo[1];
    resultArray.push(sumOfLastTwo);
    return resultArray;
  }
};

var bsearch = function (array, target) {
  var half = Math.floor((array.length / 2));
  var result = 0;
  if (array.length === 0) {
    result = null;
    return result;
  } else if (array.length === 1 && array[0] !== target) {
    result = null;
    return result;
  }
  if (array[half] === target) {
    result = half;
    return result;
  } else if (target < array[half]) {
    result = bsearch(array.slice(0, half), target);
    return result;
  } else if (target > array[half]) {
    var temp = bsearch(array.slice(half+1), target)
    if (temp === null) {
      return null;
    }
    result = half + 1 + temp;

    return result;
  }

};

var makeChange = function (change, coins) {
  if (change === 0) {
    return [];
  }
  var bestResult = [];
  var currentResult = [];
  for (var i = 0; i < coins.length; i++) {
    var amount = change;
    if (coins[i] <= amount) {
      // console.log("amount:", amount);
      // console.log("coin:", coins[i]);
      currentResult = [coins[i]];
      amount -= coins[i];
      var remainderChange = makeChange(amount, coins);
      // console.log("remainder:", remainderChange);
      currentResult = currentResult.concat(remainderChange);
      // console.log("current:", currentResult);
      // console.log("best:", bestResult);
      if (bestResult.length === 0) {
        bestResult = currentResult;
      } else if (currentResult.length < bestResult.length) {
        bestResult = currentResult;
        // console.log("how many");
      }
    }
  }
  return bestResult;
  //
  // while (change >= coins[0]) {
  //   change -= coins[0];
  //   currentResult.push(coins[0]);
  // }
  //
  // return currentResult.concat(makeChange(change, coins.slice(1)));
};
