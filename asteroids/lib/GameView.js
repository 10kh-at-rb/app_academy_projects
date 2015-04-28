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
    setInterval(function() {
      that.game.draw(that.ctx);
      that.game.step();
    }, 20);
  };



})();
