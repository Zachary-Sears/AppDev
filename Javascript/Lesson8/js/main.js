let soup = "Chicken Noodle Soup";
let isCustomerBanned = false;
let soupAccess = isCustomerBanned ? "Sorry, no soup for you!" : soup ? "Yes, we have soup" : "Sorry, no soup today";
console.log(soupAccess);

let testScore = 79;
let myGrade = testScore > 89 ? "A"
    : testScore > 79 ? "B"
    : testScore > 69 ? "C"
    : testScore > 59 ? "D"
    : "F";

console.log("My grade is a " + myGrade);

let player = "paper";
let computer = "scissors";
let result = player === computer 
    ? "Tie Game!"
    : player === "rock" && computer === "paper"
    ? "Computer wins!"
    : player === "paper" && computer === "scissors"
    ? "Computer wins!"
    : player === "scissors" && computer === "rock"
    ? "Computer wins!" : "Player wins!";

console.log(result);