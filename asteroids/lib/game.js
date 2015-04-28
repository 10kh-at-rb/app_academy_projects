;(function () {
  if (!window.Asteroids) {
    window.Asteroids = {};
  }
  "use strict"
  var NUM_ASTEROIDS = 10;
  var DIM_X = 800;
  var DIM_Y = 800;

  var Game = window.Asteroids.Game = function () {
    this.xDim = DIM_X;
    this.yDim = DIM_Y;
    this.asteroids = [];
    this.addAsteroids();
    this.ships = [];
    this.addShip();
  };

  Game.prototype.allObjects = function() {
    return [].concat(this.asteroids).concat(this.ships)
  };

  Game.prototype.addAsteroids = function () {
    for (var i = 0; i < NUM_ASTEROIDS; i++) {
      var newPos = this.randomPosition();
      var newAsteroid = new window.Asteroids.Asteroid({ pos: newPos, game: this });
      this.asteroids.push(newAsteroid);
    }
  };

  Game.prototype.addShip = function () {
    var ship = new window.Asteroids.Ship({ pos: this.randomPosition(), game: this });
    this.ships.push(ship);
  };

  Game.prototype.randomPosition = function () {
    var x = Math.random() * DIM_X;
    var y = Math.random() * DIM_Y;
    return [x, y];
  };

  Game.prototype.draw = function(ctx) {
    ctx.clearRect(0,0,800,800);
    var objects = this.allObjects();
    for (var i = 0; i < objects.length; i++) {
      objects[i].draw(ctx);
    }
  };

  Game.prototype.move = function() {
    var objects = this.allObjects();
    for (var i = 0; i < objects.length; i++) {
      objects[i].move();
    }
  };

  Game.prototype.wrap = function(pos) {
    if (pos[0] > DIM_X) {
      pos[0] = pos[0] % DIM_X;
    } else if (pos[0] < 0 ) {
      pos[0] += DIM_X;
    }
    if (pos[1] > DIM_Y) {
      pos[1] = pos[1] % DIM_X;
    } else if (pos[1] < 0 ) {
      pos[1] += DIM_X;
    }
    return pos;
  };

  // Game.prototype.checkCollisions = function() {
  //
  // };

  Game.prototype.step = function() {
    this.move();
    var objects = this.allObjects();
    for (var i = 0; i < objects.length; i++) {
      for (var j = 0; j < objects.length; j++) {
        if (objects[i] !== objects[j]) {
          if(objects[i].isCollidedWith(objects[j])) {
            objects[i].collideWith(objects[j]);
          }
        }
      }
    }
  };

  Game.prototype.remove = function(asteroid) {
    var index = this.asteroids.indexOf(asteroid);
    this.asteroids.splice(index, 1);
  };


})();
