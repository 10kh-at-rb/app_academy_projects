var readline = require('readline');

var reader = readline.createInterface({
  // it's okay if this part is magic; it just says that we want to
  // 1. output the prompt to the standard output (console)
  // 2. read input from the standard input (again, console)

  input: process.stdin,
  output: process.stdout
});

var TicTacToe = require("./ttt");

var game = new TicTacToe.Game(reader);

game.run(function (winner) {
  if (winner !== null) {
    console.log(winner + " wins!");
  } else if (winner === null) {
    console.log("Draw.");
  }
  reader.close();
});
