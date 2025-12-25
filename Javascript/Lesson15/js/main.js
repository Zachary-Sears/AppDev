// Refactor of RPS with arrays and loops

// let player;
// let playGame = confirm("Do you want to play rock, paper, sicssors?");
// if (playGame) {
//     while (playGame) {
//         const playerChoice = prompt("Please enter rock, paper, or scissors");
//         if (playerChoice || playerChoice === "") {
//             const player = playerChoice.trim().toLowerCase();
//             if (player === "rock" || player === "paper" || player === "scissors") {
//                 const computerChoice = Math.floor(Math.random() * 3);
//                 const rpsArray = ["rock", "paper", "scissors"];
//                 const computer = rpsArray[computerChoice];

//                 const result = player === computer 
//                     ? "Tie Game!"
//                     : player === "rock" && computer === "paper"
//                     ? "Computer wins with " + computer + "!"
//                     : player === "paper" && computer === "scissors"
//                     ? "Computer wins with " + computer + "!"
//                     : player === "scissors" && computer === "rock"
//                     ? "Computer wins with " + computer + "!" : "Player wins!";
//                 alert (result);
//                 playGame = confirm("Play again?");
//                 if (!playGame) alert("Ok, thanks for playing");
//                 continue;
//             } else {
//                 alert ("Player did not enter rock, paper, nor scissors.");
//                 continue;
//             }
//         } else {
//             alert ("I guess you changed your mind.");
//             break;
//         }
//     }
// } else {
//     alert ("Ok, maybe next time.");
// }

// Refactor of RPS with functions

const initGame = () => {
    const startGame = confirm("Shall we play rock, paper, scissors?");
    startGame ? playGame() : alert("Ok. maybe next time.");
};

const playGame = () => {
    while (true) {
        let playerChoice = getPlayerChoice();
        playerChoice = formatPlayerChoice(playerChoice);
        if (playerChoice === "") {
            invalidChoice();
            continue;
        }
        if (!playerChoice) {
            decidedNotToPlay();
            break;
        }

        playerChoice = evaluatePlayerChoice(playerChoice);
        if(!playerChoice) {
            invalidChoice();
            continue;
        }

        const computerChoice = getComputerChoice();
        const result = determineWinner(playerChoice, computerChoice);
        displayResult(result);
        if (askToPlayAgain()) {
            continue;
        } else {
            thanksForPlaying();
            break;
        }
    }
}

const displayResult = (result) => {
    alert(result);
};

const getPlayerChoice = () => {
    return prompt("Please return rock, paper, or scissors.");
};

const formatPlayerChoice = (playerChoice) => {
    if (playerChoice || playerChoice === "") {
        return playerChoice.trim().toLowerCase();
    } else {
        return false;
    }
};

const decidedNotToPlay = () => {
    alert("I guess you changed your mind. Maybe next time.");
};

const evaluatePlayerChoice = (playerChoice) => {
    if (playerChoice === "rock" || playerChoice === "paper" || playerChoice === "scissors") {
        return playerChoice;
    } else {
        return false;
    }
};

const invalidChoice = () => {
    alert("You didn't enter rock, paper, or scissors.");
};

const getComputerChoice = () => {
    const randomNumber = Math.floor(Math.random() * 3);
    const rpsArray = ["rock", "paper", "scissors"];
    return rpsArray[randomNumber];
};

const determineWinner = (player, computer) => {
    const winner = player === computer
        ? "Tie game!" 
        : player === "rock" && computer === "paper"
        ? `Player: ${player}\nComputer: ${computer}\nComputer wins!`
        : player === "paper" && computer === "scissors"
        ? `Player: ${player}\nComputer ${computer}\nComputer wins`
        : player === "scissors" && computer === "rock"
        ? `Player: ${player}\nComputer: ${computer}\nComputer wins`
        : "Player wins";
    
    return winner;
};

const askToPlayAgain = () => {
    return confirm("Play again?");
};

const thanksForPlaying = () => {
    alert("Ok, thanks for playing");
};

initGame();