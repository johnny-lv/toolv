"user strict"

var sort = require('./service/Sort.js');

var array = [20,21,3,0,45,122];

console.log(array);

sort.bubbleSort(array);

console.log(array);
