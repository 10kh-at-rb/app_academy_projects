(function () {
  if (typeof TTT === "undefined") {
    window.TTT = {};
  }

  var View = TTT.View = function (game, $el) {
    this.$el = $el;
    this.setupBoard();
    this.game = game;
    this.bindEvents();

  };

  View.prototype.bindEvents = function () {
    var game = this;
    $(".grid").on("click", "li", function(event) {
      var $li = $(event.currentTarget);
      game.makeMove($li)
    })
  };

  View.prototype.makeMove = function ($square) {
    // take the pos info from the $square
    // and call this.game.playMove(pos)
    var row = $square.attr("data-row");
    var col = $square.attr("data-col");
    var mark = this.game.currentPlayer;
    try {
      this.game.playMove([row, col]);
    } catch (e) {
      alert(e.msg)
    }
    $square.attr("data-mark", mark);
    $square.addClass("marked");
    if (this.game.isOver()){
      if (this.game.winner()) {
        var winner = this.game.winner();
        alert("Game Over! " + winner.toUpperCase() + " wins!");
      } else {
        alert("Game Over! Draw");
      }
    }
  };

  View.prototype.setupBoard = function () {
    var $ul = $('<ul class="grid group"></ul>');
    for (var i = 0; i < 9; i++) {
      var row = Math.floor(i / 3)
      var col = i % 3
      var $li = $("<li></li>")
        .attr("data-row", row)
        .attr("data-col", col)
        .appendTo($ul);
    }
    this.$el.append($ul);
  };
})();

// $
// game.playeMove(pos)
//
