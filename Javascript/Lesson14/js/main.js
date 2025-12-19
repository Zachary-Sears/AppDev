const myArray = [];

console.log("<<<<<<<< Add elements >>>>>>>>");
myArray[0] = "Zac";
myArray[1] = 5;
myArray[2] = true;
console.log(myArray);

console.log("<<<<<<<< Get length >>>>>>>>");
console.log(myArray.length);

console.log("<<<<<<<< Get items at index >>>>>>>>");
console.log(myArray[myArray.length -1 ]);
console.log(myArray[1]);

console.log("<<<<<<<< Push example >>>>>>>>");
myArray.push("school");
console.log(myArray);

console.log("<<<<<<<< Pop examples >>>>>>>>");
myArray.pop();
console.log(myArray);
myArray.push("school");

console.log("<<<<<<<< Pop returns the item that gets removed >>>>>>>>")
const lastItem = myArray.pop();
console.log(lastItem);

console.log("<<<<<<<< unshift example >>>>>>>>");
const newLength = myArray.unshift(42);
console.log(myArray);
console.log(newLength);

console.log("<<<<<<<< shift() example >>>>>>>>");
const firstItem = myArray.shift();
console.log(myArray);
console.log(firstItem);

console.log("<<<<<<<< Keyword delete >>>>>>>>")
delete myArray[1];
console.log(myArray);
myArray[1] = 5;

console.log("<<<<<<<< Splice() examples >>>>>>>>")
console.log("<<<<<<<< Remove elements >>>>>>>>");
myArray.splice(1,1);
console.log(myArray);
console.log(myArray[1]);

console.log("<<<<<<<< Replace elements >>>>>>>>");
myArray[1] = 5;
myArray[2] = true;
myArray.splice(1, 1, 42);
console.log(myArray);
myArray.splice(1, 0, 5);
console.log(myArray);

const myArray2 = ["A", "B", "C", "D", "E", "F"]

console.log("<<<<<<<< slice example >>>>>>>>");
const newArray = myArray2.slice(3);
console.log(newArray);

console.log("<<<<<<<< reverse example >>>>>>>>")
myArray2.reverse();
console.log(myArray2);
myArray2.reverse();

console.log("<<<<<<<< join example >>>>>>>>")
const newString = myArray2.join();
console.log(newString);

console.log("<<<<<<<< concat example >>>>>>>>");
const myArrayA = ["A", "B", "C"];
const myArrayB = ["C", "D", "E", "F"];
console.log(myArrayA);
console.log(myArrayB);
const concatArray = myArrayA.concat(myArrayB);
console.log(concatArray);

console.log("<<<<<<<< spread operator example >>>>>>>>");
const spreadOpArray = [...myArrayA, ...myArrayB];
console.log(spreadOpArray);

console.log("<<<<<<<< nested array example >>>>>>>>");
const equipShelfA = ["baseball", "football", "volleyball"];
const equipShelfB = ["badketball", "golf balls", "tenis balls"];
const clothesShelfA = ["tank tops", "t-shirts", "jerseys"];
const clothesShelfB = ["seat tops", "sweat pants", "hoodies"];

const equipDept = [equipShelfA, equipShelfB];
const clothesDept = [clothesShelfA, clothesShelfB];
console.log(equipDept);
console.log(clothesDept);
console.log("Retrieve football from equipDept");
console.log(equipDept[0][1]);
console.log("Retrieve sweat tops from clothesDept");
console.log(clothesDept[1][0]);

const sportsStore = [equipDept, clothesDept];
console.log(sportsStore);
console.log("Retrieve football from sportsStore");
console.log(sportsStore[0][0][1]);
console.log("Retrieve sweat tops from sportsStore");
console.log(sportsStore[1][1][0]);