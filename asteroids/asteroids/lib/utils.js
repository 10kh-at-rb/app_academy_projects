(function() {
  if (!window.Asteroids) {
    window.Asteroids = {};
  }

  var Util = window.Asteroids.Util =  {};

  Util.randomVec = function(length) {
    // Math.random() * (max - min) + min;
    var x = Math.random() * 2 * length - length;
    var y = Math.sqrt(Math.pow(length, 2) - Math.pow(x, 2));
    var rand = Math.floor(Math.random() * 2);
    if (rand === 0) { y *= -1; }
    return [x, y];
  };


  Util.inherits = function (childClass, parentClass) {
    function Surrogate() {};
    Surrogate.prototype = parentClass.prototype;
    childClass.prototype = new Surrogate();
  };

})();
