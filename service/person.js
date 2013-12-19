function Person(name, age) {
    this.message = name + " is " + age + " years old! Hi...";
};

Person.prototype.greet = function() {
    console.log(this.message);
};

Person.prototype.slowGreet = function() {
    var self = this;
    setTimeout(function() {
        console.log(self.message);
    }, 1000);
};

module.exports = Person;
