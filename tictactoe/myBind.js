Function.prototype.myBind = function (context) {
  var fn = this;

  return function () {
    return fn.apply(context);
  };
};

var Cat = function (name, age) {
  this.name = name;
  this.age = age;
};

Cat.prototype.sayHi = function () {
  return "hello my name is " + this.name;
};

var testCat = new Cat("Sennacy", 7);

var dog = { name: "snoop"};

var mySayHi = testCat.sayHi.myBind(dog);

var otherMySayHi = testCat.sayHi;

console.log(mySayHi());

console.log(otherMySayHi());
