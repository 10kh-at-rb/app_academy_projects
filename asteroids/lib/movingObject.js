(function () {
  if (!window.Asteroids) {
    window.Asteroids = {};
  }

  var movingObject = window.Asteroids.movingObject = function (obj) {
    this.pos = obj.pos;
    this.vel = obj.vel;
    this.radius = obj.radius;
    this.color = obj.color;
    this.game = obj.game;
  };

  movingObject.prototype.draw = function(ctx) {
    ctx.fillStyle = this.color;
    ctx.beginPath();
    ctx.arc(this.pos[0], this.pos[1], this.radius, 0, Math.PI*2, true);
    ctx.closePath();
    ctx.fill();
  };

  movingObject.prototype.move = function() {
    this.pos[0] += this.vel[0];
    this.pos[1] += this.vel[1];
    this.game.wrap(this.pos);
  };

  movingObject.prototype.isCollidedWith = function(otherObject) {
    var x_dist = Math.pow((this.pos[0] - otherObject.pos[0]), 2);
    var y_dist = Math.pow((this.pos[1] - otherObject.pos[1]), 2);
    var dist = Math.sqrt(x_dist + y_dist);
    if (dist <= (this.radius + otherObject.radius)) {
      return true;
    } else {
      return false;
    }
  };

  movingObject.prototype.collideWith = function(otherObject) {
    // this.game.remove(otherObject);
    // this.game.remove(this);
  };

})();
