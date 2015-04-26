function Board () {
  this.tiles = [
                [null, null, null],
                [null, null, null],
                [null, null, null]
               ]
}

Board.prototype.placeMark = function (pos, mark) {
  if (this.isEmpty(pos, mark)) {
    this.tiles[pos[0]][pos[1]] = mark;
  };
};

Board.prototype.won = function () {
  if (this.winner() !== null) {
    return true;
  } else {
    return false;
  };
};

Board.prototype.isFull = function () {
  var count = 0;
  for (var i = 0; i < this.tiles.length; i++) {
    for (var j = 0; j < this.tiles[i].length; j++) {
      if (this.tiles[i][j] !== null) {
        count++
      };
    };
  };
  if (count === 9) {
    return true;
  } else {
    return false;
  };
};

Board.prototype.winner = function () {
  for (var i = 0; i < this.tiles.length; i++) {
    if (this.tiles[i][0] === this.tiles[i][1] && this.tiles[i][1] === this.tiles[i][2]) {
      return this.tiles[i][0];
    } else if (this.tiles[0][i] === this.tiles[1][i] && this.tiles[1][i] === this.tiles[2][i]) {
      return this.tiles[0][i];
    };
  };
  if (this.tiles[0][0] === this.tiles[1][1] && this.tiles[1][1] === this.tiles[2][2]) {
    return this.tiles[1][1];
  } else if (this.tiles[0][2] === this.tiles[1][1] && this.tiles[1][1] === this.tiles[2][0]) {
    return this.tiles[1][1];
  };

  return null;
};

//off board needs to work
Board.prototype.isEmpty = function (pos) {
  if (this.tiles[pos[0]][pos[1]] === null) {
    return true;
  } else {
    return false;
  };
};

var between = function (num, a, b) {
  if (num >= a && num <= b) {
    return true;
  } else {
    return false;
  };
};

Board.prototype.isValidMove = function (row, col) {
  if (between(row, 0, 2) && between(col, 0, 2) && this.isEmpty([row,col])) {
    return true;
  } else {
    return false;
  };
};


//display could be better
Board.prototype.display = function () {
  var displayRow = function(array) {
    var display = ""
    for (var i = 0; i < array.length; i++) {
      if (array[i] === null) {
        display += "   ";
      } else {
        display += " " + array[i] + " ";
      };
      if (i < 2) {
        display += "|";
      };
    };
    console.log(display);
  };

  for (var j = 0; j < this.tiles.length; j++) {
    displayRow(this.tiles[j]);
    if (j < 2) {
      console.log("---+---+---");
    };
  };
};

module.exports = Board;
