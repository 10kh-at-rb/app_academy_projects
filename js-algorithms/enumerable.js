var dumb = function (val1, val2) {
  return val1 + val2;
};

Array.prototype.myEach = function (myFunction) {
  for (var i = 0; i < this.length; i++) {
    myFunction(this[i]);
  }
};

Array.prototype.myMap = function (myFunction) {
  var newArray = [];

  var map = function (el) {
    newArray.push(myFunction(el));
  };

  this.myEach(map);

  return newArray;
};

Array.prototype.myInject = function (accum, myFunction) {
  var injecter = function (current_value) {
    accum = myFunction(accum, current_value);
  };
  this.myEach(injecter);
  return accum;
};
