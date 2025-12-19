// Global scope
var x = 1;
console.log("Global scope x: " + x);

// Local scope
{
    let y = 2;
    console.log("Block scope y: " + y);
}

// Local scope
function myFunction() {
    const z = 5;
    console.log("Function scope z: " + z);
}

myFunction();

console.log("<<<<<<<< Start scope example >>>>>>>>");

var x = 1;
let y = 2;
const z = 3;

console.log("global: " + x);
console.log("global: " + y);
console.log("global: " + z);

function myFunc() {
    console.log("From myFunc");
    var x = 10;
    const z = 5;
    console.log("function: " + x);
    console.log("function: " + y);
    console.log("function: " + z);

    {
        var x = 15;
        const z = 20;
        console.log("From block");
        console.log("block: " + x);
        console.log("block: " + y);
        console.log("block: " + z);
    }

    console.log("From myFunc again");
    console.log("function: " + x);
    console.log("function: " + y);
    console.log("function: " + z);
}

myFunc();