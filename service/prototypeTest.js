function Person(name) {
    this.name = name;
}

Person.prototype.sayHello = function() {
    console.log("I am "+ this.name);
};

function Employee(name, salary) {
    Person.call(this, name);

    this.salary = salary;
}

Employee.prototype = new Person();

Employee.prototype.showMeMoney = function() {
    console.log("Salary is "+ this.salary);
};

var johnny = new Person("Johnny");
var jasmine = new Person("Jasmine");

johnny.sayHello();

console.log(johnny.sayHello);
console.log(johnny.sayHello == jasmine.sayHello);

var jack = new Employee("Jack", 9999);

jack.sayHello();
jack.showMeMoney();

Employee.prototype.retire = function() {
    console.log("Retire la "+ this.name);
};

jack.retire();
