console.log("<<<<<<<< Start sum function example >>>>>>>>");

function sum(num1, num2) {
    if (num2 === undefined) {
        return num1 + num1;
    }
    return num1 + num2;
}
console.log(sum(2, 6));
console.log(typeof sum()); //Gives the return type of the function

console.log("<<<<<<<< End sum function example >>>>>>>>");
console.log("<<<<<<<< Start getUsernameFromEmail function example >>>>>>>>");

function getUsernameFromEmail(email) {
    return email.slice(0, email.indexOf("@"));
}
console.log(getUsernameFromEmail("user@NoWhere.anywhere"));

console.log("<<<<<<<< End getUsernameFromEmail function example >>>>>>>>");
console.log("<<<<<<<< Start getUsernameFromEmail arrow function example >>>>>>>>");

const Username = (email) => {
    return email.slice(0, email.indexOf("@"));
}
console.log(Username("user@Nowhere.anywhere"));

console.log("<<<<<<<< End getUsernameFromEmail arrow function example >>>>>>>>");
console.log("<<<<<<<< Start toProperCase function example >>>>>>>>");


const toProperCase = (name) => {
    return name.charAt(0).toUpperCase() + name.slice(1).toLowerCase();
}
console.log(toProperCase("zAcHarY"))

console.log("<<<<<<<< End toProperCase function example >>>>>>>>");
