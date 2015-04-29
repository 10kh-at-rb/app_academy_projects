(function () {
  if (typeof TOH === "undefined") {
    window.TOH = {};
  }

  var View = TOH.View = function (game, $el) {
    this.$el = $el;
    this.game = game;
    this.setupTowers();
    this.render();
    this.clickTower();
    this.towerNumber = -1;
  };

  View.prototype.clickTower = function() {
    var that = this;
    $(".TOH").on("click", "ul", function(event) {
      if (that.towerNumber > -1) {
        var startTower = that.towerNumber;
        var $tower = $(event.currentTarget);
        var endTower = $tower.attr("data-tower");
        $el.children().removeClass("clicked");
        that.towerNumber = -1;

        if(that.game.isValidMove(startTower, endTower)) {
          that.game.move(startTower, endTower);
          that.render();
          that.isWon();

        } else {
          alert("invalid move");
        }

      } else {
        var $tower = $(event.currentTarget);
        that.towerNumber = $tower.attr("data-tower");
        $tower.addClass("clicked");
      }

    })
  };

  View.prototype.isWon = function () {
    if (this.game.isWon()) {
      alert("You won!");
    }
  };

  View.prototype.setupTowers = function () {
    for (var i = 0; i < 3; i++) {
      var $ul = $('<ul class="tower"></ul>');
      $ul.attr('data-tower', i);
      for (var j = 2; j > -1; j--) {
        var $li = $('<li class="disc"></li>');
        $li.attr("data-disc", j);
        $ul.append($li);
      }
      $el.append($ul);
    }
  };

  View.prototype.render = function () {
    var $lis = $("li");
    $lis.removeClass("d1 d2 d3");
    for (var i = 0; i < 3; i++) {
      for (var j = 0; j < 3; j++) {
        var $currentTower = $($el.children()[i]);
        var currentEl = this.game.towers[i][j];
        var towerIdx;
        if (j == 0) {
          towerIdx = 2
        } else if (j === 2) {
          towerIdx = 0
        } else {
          towerIdx = j
        }
        $slot = $($currentTower.children()[towerIdx])
        if(currentEl) {
          $slot.addClass("d" + currentEl);
        }
      }
    }

  }
})();
