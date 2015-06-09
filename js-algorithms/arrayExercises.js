Array.prototype.myUniq = function () {
  var newArray = [];
  var i = 0;
  for(i; i < this.length; i++) {
    if (newArray.indexOf(this[i]) === -1) {
       newArray.push(this[i]);
     }
   }
   return newArray;
};

Array.prototype.twoSum = function () {
  var result = [];
  var i = 0;
  for(i; i < this.length; i++) {
    var j = i + 1;
    for(j; j < this.length; j++) {
      if (this[i] + this[j] === 0) {
        result.push([i, j]);
      }
    }
  }
  return result.toString();
};

var rows = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8]
  ];

Array.prototype.myTranspose = function () {
  var newArray = new Array(this[0].length);
  for (var i = 0; i < newArray.length; i++) {
    newArray[i] = [];
  }

  for (var i = 0; i < this.length; i++) {
    for (var j = 0; j < this.length; j++) {
      newArray[j][i] = this[i][j];
    }
  }
  return newArray;
};
