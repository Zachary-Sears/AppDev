let myBoolean = confirm("Ok === True\nCancel === False");
console.log(myBoolean);
let userName = prompt("Please enter your name.");
if (userName) {
    console.log(userName.length);
    console.log(userName.trim().length)
    console.log(userName);
} else {
    console.log("No name entered");
}