function Person(firstName, lastName, age) {
    var _firstName = firstName;
    var _lastName = lastName;

    var constant_value = "hahaha";

    this.age = age;

    this.getName = function() {
        console.log(_firstName +" "+_lastName);
        return _firstName +" "+_lastName;
    };
    this.getName2 = function() {
        console.log(firstName +" "+lastName + " " + constant_value);
        return firstName +" "+lastName;
    };

    this.sayHello = function() {
        console.log("I am "+ this.getName() + ", age "+ age);
    };
}

var johnny = new Person("Johnny", "Lv", 29);

johnny.getName();
johnny.getName2();
johnny.sayHello();

console.log(johnny.age);
console.log(johnny._firstName);
