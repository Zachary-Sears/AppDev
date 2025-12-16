let customerBanned = false;
let soup = "chicken noodle soup";
let crackers = false;
let reply;

if (customerBanned) {
    reply = "No soup for you!"
} else if (soup && crackers) {
    reply = "Here's your order of " + soup + " and crackers!" 
}else if (soup) {
    reply = "Here's your order of " + soup;
} else {
    reply = "Sorry, we're out of soup."
}

console.log(reply);

let testScore = 89;
let collegeStudent = true;
let grade;

if (testScore >= 90) {
    grade = "A";
} else if (testScore >= 80) {
    grade = "B";
} else if (testScore >= 70) {
    grade = "C";
} else if (testScore >= 60) {
    grade = "D";
} else {
    if (collegeStudent) {
        grade = "U";
    } else {
        grade = "F";
    }
}

console.log(grade);