function MovingObject (velocity) {
  this.velocity = velocity;
};

Function.prototype.inherits = function (superClass) {
  // var subclass = this;
  // var args = Array.prototype.slice.apply(arguments, [1])
  // subclass.prototype = new Surrogate();
  function Surrogate() {};
  Surrogate.prototype = superClass.prototype;
  this.prototype = new Surrogate();
};


function Ship () {};
Ship.inherits(MovingObject);

function Asteroid (velocity) {
  MovingObject.call(this, velocity)
};

Asteroid.inherits(MovingObject, velocity);

Asteroids.prototype.aHi = function() { return "asteroid hi"; };
MovingObj
