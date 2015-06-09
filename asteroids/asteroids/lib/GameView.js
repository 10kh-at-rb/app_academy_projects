(function () {
  if (!window.Asteroids) {
    window.Asteroids = {};
  }

  var GameView = window.Asteroids.GameView = function(ctx, game) {
    this.ctx = ctx;
    this.game = game;
  }

  GameView.prototype.start = function () {
    var that = this;
    this.bindKeyHandlers()
    setInterval(function() {
      that.game.draw(that.ctx);
      that.game.step();
    }, 20);
  };

  GameView.prototype.bindKeyHandlers = function() {
    var ship = this.game.ships[0]
    key('up', function () { ship.power([0,-1]); } );
    key('down', function () { ship.power([0,1]); } );
    key('left', function () { ship.power([-1,0]); } );
    key('right', function() { ship.power([1,0]); } );
  };



})();
