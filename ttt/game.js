var Board = require("./board");

function Game (reader) {
  this.board = new Board();
  this.reader = reader;
  this.currentMark = "X";
}


Game.prototype.run = function (completionCallback) {
  var that = this;
  if (this.board.won() || this.board.isFull()) {
    this.board.display();
    completionCallback(this.board.winner());
  } else {
    this.board.display();
    console.log(that.currentMark + "'s turn. GO!")

    this.reader.question("Choose row: ", function (row) {

      that.reader.question("Choose column: ", function (col) {

        if (that.board.isValidMove(row,col)) {
          that.board.placeMark([row, col], that.currentMark);
          that.switchMark(that.currentMark);
          that.run(completionCallback);
        } else {
          console.log("Not a valid move. Try again.");
          that.run(completionCallback);
        }
      });
    });
  };
};

Game.prototype.switchMark = function (currentMark) {
  currentMark === "X" ? this.currentMark = "O" : this.currentMark = "X";
};

module.exports = Game;
