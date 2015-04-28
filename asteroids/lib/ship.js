(function() {
  if (!window.Asteroids) {
    window.Asteroids = {};
  }

  var RADIUS = 15;
  var COLOR = "white";


  var Ship = window.Asteroids.Ship = function (obj) {
    window.Asteroids.movingObject.call(this, {
      color: COLOR,
      pos: obj.pos,
      radius: RADIUS,
      vel: [0, 0],
      game: obj.game
    });
  };

  window.Asteroids.Util.inherits(Ship, window.Asteroids.movingObject);


  Ship.prototype.relocate = function() {
    this.pos = this.game.randomPosition();
    this.vel = [0,0];
    console.log("relocate me")
  };

  Ship.prototype.power = function(impulse) {
    this.vel[0] += impulse[0];
    this.vel[1] += impulse[1];
  };




})();
