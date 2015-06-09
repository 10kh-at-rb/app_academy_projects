function Clock () {
  this.hours = null;
  this.minutes = null;
  this.seconds = null;
}

var padNumber = function (number, length) {
  var newString = number + "";
  while (newString.length != length) {
    newString = "0" + newString;
  }
  return newString;
}

Clock.TICK = 5000;

Clock.prototype.printTime = function () {
  console.log(padNumber(this.hours, 2) + ":"
  + padNumber(this.minutes, 2) + ":"
  + padNumber(this.seconds, 2));
};

Clock.prototype.run = function () {
  // 1. Set the currentTime.
  // 2. Call printTime.
  // 3. Schedule the tick interval.
  var date = new Date();
  this.hours = date.getHours();
  this.minutes = date.getMinutes();
  this.seconds = date.getSeconds();
  this.printTime();
  setInterval(this._tick.bind(this), Clock.TICK);
};

Clock.prototype._tick = function () {
  // 1. Increment the currentTime.
  // 2. Call printTime.
  var tickSeconds = Clock.TICK / 1000;

  var totalSeconds = this.seconds + tickSeconds;
  this.seconds = (totalSeconds) % 60;

  var totalMinutes = this.minutes + Math.floor(totalSeconds / 60);
  this.minutes = (totalMinutes) % 60;

  this.hours = (this.hours + Math.floor(totalMinutes / 60)) % 24;

  this.printTime();
};

var clock = new Clock();
//clock.run();

var readline = require('readline');

var reader = readline.createInterface({
  // it's okay if this part is magic; it just says that we want to
  // 1. output the prompt to the standard output (console)
  // 2. read input from the standard input (again, console)

  input: process.stdin,
  output: process.stdout
});

var addNumbers = function (sum, numsLeft, completionCallback) {
  if (numsLeft > 0) {
    reader.question("Enter number to add:", function (numString) {
      sum = sum + parseInt(numString);
      numsLeft -= 1;
      console.log("Current sum: " + sum);

      addNumbers(sum, numsLeft, completionCallback);
    });
  }
  else if (numsLeft === 0) {
    reader.close();
    completionCallback(sum);
  };
}

// addNumbers(0, 3, function (sum) {
//   console.log("Total Sum: " + sum);
// });

function askIfGreaterThan (el1, el2, callback) {
  // Prompt user to tell us whether el1 > el2; pass true back to the
  // callback if true; else false.
  reader.question("Is " + el1 + " greater than " + el2 + "? ",
  function (answer) {
    if (answer === "yes") {
      callback(true);
    } else {
      callback(false);
    };
  });
};

function innerBubbleSortLoop (arr, i, madeAnySwaps, outerBubbleSortLoop) {
  // Do an "async loop":
  // 1. If (i == arr.length - 1), call outerBubbleSortLoop, letting it
  //    know whether any swap was made.
  // 2. Else, use `askIfGreaterThan` to compare `arr[i]` and `arr[i +
  //    1]`. Swap if necessary. Call `innerBubbleSortLoop` again to
  //    continue the inner loop. You'll want to increment i for the
  //    next call, and possibly switch madeAnySwaps if you did swap.

  if (i === arr.length - 1) {
    outerBubbleSortLoop(madeAnySwaps);
  } else {

    var answer = null;

    askIfGreaterThan(arr[i], arr[i + 1], function (callbackAnswer) {
      answer = callbackAnswer;
      if (answer) {
        var temp = arr[i];
        arr[i] = arr[i+1];
        arr[i+1] = temp;
        madeAnySwaps = true;
      };

      innerBubbleSortLoop(arr, i + 1, madeAnySwaps, outerBubbleSortLoop);
    });
  };
};

function absurdBubbleSort (arr, sortCompletionCallback) {
  function outerBubbleSortLoop (madeAnySwaps) {
    // Begin an inner loop if `madeAnySwaps` is true, else call
    // `sortCompletionCallback`.
    if (madeAnySwaps) {
      innerBubbleSortLoop(arr, 0, false, outerBubbleSortLoop)
    } else {
      sortCompletionCallback(arr);
    }
  }

  // Kick the first outer loop off, starting `madeAnySwaps` as true.
  outerBubbleSortLoop(true);
}

absurdBubbleSort([3, 2, 1], function (arr) {
  console.log("Sorted array: " + JSON.stringify(arr));
  reader.close();
});
