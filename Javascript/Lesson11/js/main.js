let myNumber = 0;

console.log("Start while loop.");

// While loop:
while (myNumber < 10) {
    console.log(myNumber + 1);
    myNumber ++;
}

console.log("<<<<<<<<Ending while loop>>>>>>>>");
console.log("Start do while loop.");

myNumber = 0;

//do while
do {
    console.log(myNumber);
    myNumber ++;
} while (myNumber < 10);

console.log("<<<<<<<<Ending do while loop>>>>>>>>");
console.log("Start for loop.");

myNumber = 0;

for (let i = 0; i <= 10; i ++) {
    console.log(i);
}

console.log("<<<<<<<<Ending for loop>>>>>>>>");
console.log("Start for loop string iteration example.")

let name = "Zac";

for (let i = 0; i <= name.length; i ++) {
    console.log(name.charAt(i));
}

console.log("<<<<<<<<Ending string iteration loop>>>>>>>>");
console.log("Break out of infinite while(true) loop.");

let counter = 0;
let myLetter;

while (counter <= 2) {
    myLetter = name[counter];
    console.log(myLetter);
    if (counter === 1) {
        counter += 1;
        continue;
    }
    if (myLetter === "c") break;
    counter ++;
}

console.log("<<<<<<<<Ending break out of while(true) loop>>>>>>>>");