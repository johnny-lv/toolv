/*
 * Sort provides different sort service.
 * - Johnny.Lv
 * - 2013-12-08
 */
"use strict"

var _ = require("underscore");

var Sort = function Sort() {};

_.extend(Sort.prototype, {

    bubbleSort: function(array, callback) {
       for(var i = 0; i < array.length; i++) {
            for(var j = i; j < array.length; j++) {
                if(array[i] < array[j]) {
                    var temp = array[i];
                    array[i] = array[j];
                    array[j] = temp;
                }
            }
       }
    }

});

var sort = new Sort();

module.exports = sort;
