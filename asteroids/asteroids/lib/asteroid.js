(function() {
  if (!window.Asteroids) {
    window.Asteroids = {};
  }

  var COLOR = "red";
  var RADIUS = 8;
  var MAX_LENGTH = 5;

  var length = Math.random() * MAX_LENGTH;
  // var a = window.Asteroids;

  var Asteroid = window.Asteroids.Asteroid = function (obj) {
    window.Asteroids.movingObject.call(this, {
      color: COLOR,
      pos: obj.pos,
      radius: RADIUS,
      vel: window.Asteroids.Util.randomVec(length),
      game: obj.game
    });
  };

  window.Asteroids.Util.inherits(Asteroid, window.Asteroids.movingObject);

  Asteroid.prototype.collideWith = function(otherObject) {
    if (otherObject instanceof Asteroids.Ship) {
      console.log(otherObject)
      otherObject.relocate();

    }
    // this.game.remove(otherObject);
    // this.game.remove(this);
  };






})();
