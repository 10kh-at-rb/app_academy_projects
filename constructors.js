var Cat = function(name, owner) {
  this.name = name;
  this.owner = owner;
};

Cat.prototype.cuteStatement = function(name, owner) {
  return this.owner + " loves " + this.name;
};

var cat1 = new Cat("eric", "god");
var cat2 = new Cat("firth", "huh");
var cat3 = new Cat("4444", "777");

console.log(cat1.cuteStatement())
console.log(cat2.cuteStatement())
console.log(cat3.cuteStatement())

Cat.prototype.cuteStatement = function(name, owner) {
  return "Everyone loves " + this.name;
};

console.log(cat1.cuteStatement());
console.log(cat2.cuteStatement());
console.log(cat3.cuteStatement());

Cat.prototype.meow = function() {
  return "meow";
};
//
console.log(cat3.meow())
cat1.meow = function () {
  return "hahah"
};
console.log(cat1.meow())
