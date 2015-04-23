Array.prototype.bubbleSort = function () {
  var sorted = false;
  do {
    sorted = true;
    for (var i = 0; i < this.length - 1; i++) {
      var j = i + 1;
      if (this[i] > this[j]) {
        var temp = this[i];
        this[i] = this[j];
        this[j] = temp;
        sorted = false;
      }
    }
  } while (!sorted);
  return this;
};

var substrings = function(string) {
  var subs = [];
  var letters = string.split('');

  letters.forEach(function(el, index){
    var substring = el;
    subs.push(el);
    letters.slice(index+1).forEach(function(el2){
      substring += el2;
      subs.push(substring);
    });

  });
  return subs;
};
