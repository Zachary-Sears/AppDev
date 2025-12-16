//Initialize a string with my name
const myName = "Zachary";

//Get a random number within the range of my name
const randomIndex1 = Math.floor(Math.random() * myName.length);
const randomIndex2 = Math.floor(Math.random() * myName.length);
const randomIndex3 = Math.floor(Math.random() * myName.length);
const randomIndex4 = Math.floor(Math.random() * myName.length);
const randomIndex5 = Math.floor(Math.random() * myName.length);

//Print to console
console.log(randomIndex1 + ": " + myName.charAt(randomIndex1));
console.log(randomIndex2 + ": " + myName.charAt(randomIndex2));
console.log(randomIndex3 + ": " + myName.charAt(randomIndex3));
console.log(randomIndex4 + ": " + myName.charAt(randomIndex4));
console.log(randomIndex5 + ": " + myName.charAt(randomIndex5));