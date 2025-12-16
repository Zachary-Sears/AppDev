let player;
let playGame = confirm("Do you want to play rock, paper, sicssors?");
if (playGame) {
    let playerChoice = prompt("Please enter rock, paper, or scissors");
    if (playerChoice) {
        let player = playerChoice.trim().toLowerCase();
        if (player === "rock" || player === "paper" || player === "scissors") {
            let computerChoice = Math.floor(Math.random() * 3 + 1);
            let computer = computerChoice === 1 ? "rock"
                : computerChoice === 2 ? "paper"
                : "scissors";

            let result = player === computer 
                ? "Tie Game!"
                : player === "rock" && computer === "paper"
                ? "Computer wins with " + computer + "!"
                : player === "paper" && computer === "scissors"
                ? "Computer wins with " + computer + "!"
                : player === "scissors" && computer === "rock"
                ? "Computer wins with " + computer + "!" : "Player wins!";
            alert (result);
            let playAgain = confirm("Play again?");
            playAgain ? location.reload() : alert("Ok, thanks for playing.");
        } else {
            alert ("Player did not enter rock, paper, nor scissors.");
            let playAgain = confirm("Try again?");
            playAgain ? location.reload() : alert("Ok, thanks for playing.");
        }
    } else {
        alert ("I guess you changed your mind.");
    }
} else {
    alert ("Ok, maybe next time.");
}