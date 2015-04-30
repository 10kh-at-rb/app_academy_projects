(function() {
  if (!window.Snake) {
    window.Snake = {};
  }
  var View = window.Snake.View = function($el) {
    this.$el = $el;
    this.board = new window.Snake.Board();
    this.step();

  };

  View.prototype.keyDown = function() {
    this.$el.on("keydown", function(event) {
      this.handleKeyEvent(event);
    });
  };

  View.prototype.step = function() {
    var board = this.board
    setInterval(function() {
      board.snake.move();
      $pre = $("<pre></pre>");
      $pre.append(board.render());
    }, 1000/20);
  };

  View.prototype.handleKeyEvent = function(event) {
    if (event.keyCode === '38') {
      this.board.snake.turn("N");
    } else if (event.keyCode === '37') {
      this.board.snake.turn("W");
    } else if (event.keyCode === '40') {
      this.board.snake.turn("S");
    } else if (event.keyCode === '39') {
      this.board.snake.turn("E");
    }
  };


})();
