var readline = require('readline');

var reader = readline.createInterface({
  // it's okay if this part is magic; it just says that we want to
  // 1. output the prompt to the standard output (console)
  // 2. read input from the standard input (again, console)

  input: process.stdin,
  output: process.stdout
});

var range = function(num) {
  var newArray = [];
  for (var i = 1; i < num+1; i++) {
    newArray.push(i);
  };
  return newArray;
};


function TowersOfHanoi(numDiscs) {
  this.stacks = [range(numDiscs).reverse(), [], []];
  this.numDiscs = numDiscs;
};

TowersOfHanoi.prototype.isWon = function() {
  if (this.stacks[2].length === this.numDiscs) {
    return true;
  } else {
    return false;
  };
};

TowersOfHanoi.prototype.validStacks = function (startTowerIdx, endTowerIdx) {
  if (!(this.stacks[endTowerIdx].length === 0) &&
   this.stacks[startTowerIdx] < this.stacks[endTowerIdx]) {
    return true;
  } else {
    return false;
  }
};

TowersOfHanoi.prototype.isValidMove = function (startTowerIdx, endTowerIdx) {
  if (this.stacks[endTowerIdx].length === 0 || this.validStacks(startTowerIdx, endTowerIdx)) {
    return true;
  } else {
    return false;
  }
};

TowersOfHanoi.prototype.move = function (startTowerIdx, endTowerIdx) {
  if (this.isValidMove(startTowerIdx, endTowerIdx)) {
    this.stacks[endTowerIdx].push(this.stacks[startTowerIdx].pop());
    return true;
  } else {
    return false;
  }
}

TowersOfHanoi.prototype.print = function () {
  console.log(JSON.stringify(this.stacks))
}

TowersOfHanoi.prototype.promptMove = function (callback) {
  // prints the stacks
  // prompts user for move
  this.print();
  reader.question("Choose a stack to move from: ", function (fromStack) {
    reader.question("Choose a stack to move to: ", function (toStack) {
      return callback(fromStack, toStack);
    });
  });
};

TowersOfHanoi.prototype.run = function (completionCallback) {
  this.promptMove((function (fromStack, toStack) {
    var moveResult = this.move(fromStack, toStack);

    if (!moveResult) {
      console.log("Try Again.");
    };

    if (this.isWon()) {
      console.log("You won!");
      completionCallback();
    } else {
      this.run(completionCallback);
    };

  }).bind(this));
};

var game = new TowersOfHanoi(2);
game.run(function () {
  reader.close();
});
