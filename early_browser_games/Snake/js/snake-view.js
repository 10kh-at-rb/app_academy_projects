(function() {
  if (!window.Snake) {
    window.Snake = {};
  }
  var View = window.Snake.View = function($el) {
    this.$el = $el;
    this.board = new window.Snake.Board();
    this.$ul = this.makeAndFillUl();
    this.step();
    $(window).on("keydown", this.handleKeyEvent.bind(this));

  };

  View.prototype.keyDown = function() {
    $("window").on("keydown", function(event) {
      debugger;
      this.handleKeyEvent(event);
    });
  };

  View.prototype.step = function() {
    var that = this;
    setInterval(function() {
      that.board.snake.move()
      that.board.render();
      that.render();
    }.bind(this), 1000/60);
  };

  View.prototype.handleKeyEvent = function(event) {
    if (event.keyCode === 38) {
      this.board.snake.turn("N");
    } else if (event.keyCode === 37) {
      this.board.snake.turn("E");
    } else if (event.keyCode === 40) {
      this.board.snake.turn("S");
    } else if (event.keyCode === 39) {
      this.board.snake.turn("W");
    }
  };

  View.prototype.makeAndFillUl = function() {
    var $ul = $('<ul class="game group">');
    var numSquares = this.board.dimX * this.board.dimY;
    for (var i = 0; i < numSquares; i++) {
      var $li = $('<li class="snake-square"</li>')
      $ul.append($li);
    }
    this.$el.append($ul);
    return $ul;
  }

  View.prototype.render = function() {
    $("li").removeClass("snake apple");

    var count = 0;
    for (var i = 0; i < this.board.dimX; i++) {
      for (var j = 0; j < this.board.dimY; j++) {
        count++;
        var currentItem = this.board.grid[i][j];
        var $li = $("li").eq(count)
        if (currentItem === "S") {
          $li.addClass("snake");
        } else if (currentItem === "A") {
          $li.addClass("apple");
        }
      }
    };
  };


})();
