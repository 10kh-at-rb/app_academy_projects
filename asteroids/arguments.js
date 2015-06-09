var sum = function () {
  var args = Array.prototype.slice.apply(arguments);
  var sum = 0;
  for (var i = 0; i < args.length; i++) {
    sum += args[i];
  };
  return sum;
};

console.log(sum(1, 2, 3, 4, 5));

Function.prototype.myBind = function() {
  var args = Array.prototype.slice.apply(arguments);
  var fn = this;
  var obj = args.shift();
  return function () {
    return fn.apply(obj, args);
  }
};

//
// function Cat(name) {
//   this.name = name;
// };
//
// Cat.prototype.sayHi = function() {
//   return "Hi! My name is " + this.name + " and my args are: " + JSON.stringify(arguments);
// };
//
// var sennacy = new Cat("Sennacy");
//
// function Dog(name) {
//   this.name = name;
// }
//
// var dog = new Dog("fido");
//
// var newFunction = sennacy.sayHi.myBind(dog, 56356,23423,"hello");
//
// var testFunction = function() {
//
// };
var curriedSum = function(numArgs) {
  var numbers = [];
  function _curriedSum(num) {
    numbers.push(num);
    if (numbers.length === numArgs) {
      var total = numbers.reduce(function(a,b) {
        return a + b;
      });
      return total;
    } else {
      return _curriedSum;
    }
  };
  return _curriedSum;
};

var fun = curreidSum(2)
funA = fun(1);


Function.prototype.curry = function (numArgs) {
  var args = Array.prototype.slice.call(arguments, 1);
  // var args = [];
  var originalFunction = this;
  function _curry(arg) {
    args.push(arg);
    if (args.length === numArgs) {
      return originalFunction.apply(null, args);
    } else {
      return _curry;
    }
  };
  return _curry;
};
