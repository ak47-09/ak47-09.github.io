let deck, playerHand, dealerHand;
let playerScore = 0, dealerScore = 0;

const suits = ['hearts', 'diamonds', 'clubs', 'spades'];
const values = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A'];

function startGame() {
    deck = createDeck();
    shuffleDeck(deck);
    playerHand = [dealCard(), dealCard()];
    dealerHand = [dealCard(), dealCard()];
    playerScore = calculateScore(playerHand);
    dealerScore = calculateScore(dealerHand);
    displayGame();
}

function createDeck() {
    let deck = [];
    for (let suit of suits) {
        for (let value of values) {
            deck.push({ value, suit });
        }
    }
    return deck;
}

function shuffleDeck(deck) {
    for (let i = deck.length - 1; i > 0; i--) {
        const j = Math.floor(Math.random() * (i + 1));
        [deck[i], deck[j]] = [deck[j], deck[i]];
    }
}

function dealCard() {
    return deck.pop();
}

function calculateScore(hand) {
    let score = 0;
    let aces = 0;
    hand.forEach(card => {
        if (card.value === 'A') {
            aces++;
            score += 11;
        } else if (['K', 'Q', 'J'].includes(card.value)) {
            score += 10;
        } else {
            score += parseInt(card.value);
        }
    });
    while (score > 21 && aces > 0) {
        score -= 10;
        aces--;
    }
    return score;
}

function displayGame() {
    document.getElementById('player-cards').innerHTML = renderCards(playerHand);
    document.getElementById('dealer-cards').innerHTML = renderCards(dealerHand, true);
    document.getElementById('player-score').textContent = playerScore;
    document.getElementById('dealer-score').textContent = dealerScore;
    document.getElementById('game-message').textContent = "";
}

function renderCards(hand, hideFirstCard = false) {
    return hand.map((card, index) => {
        if (index === 0 && hideFirstCard) {
            return '<img src="png/back.png" alt="Card Back" class="card">';
        } else {
            return `<img src="png/${card.value}_of_${card.suit}.png" alt="${card.value} of ${card.suit}" class="card">`;
        }
    }).join('');
}

function hit() {
    if (playerScore < 21) {
        playerHand.push(dealCard());
        playerScore = calculateScore(playerHand);
        displayGame();
        if (playerScore > 21) {
            document.getElementById('game-message').textContent = "You busted!";
        }
    }
}

function stand() {
    while (dealerScore < 17) {
        dealerHand.push(dealCard());
        dealerScore = calculateScore(dealerHand);
    }
    displayGame();
    determineWinner();
}

function determineWinner() {
    if (playerScore > 21) {
        document.getElementById('game-message').textContent = "You busted! Dealer wins!";
    } else if (dealerScore > 21) {
        document.getElementById('game-message').textContent = "Dealer busted! You win!";
    } else if (playerScore > dealerScore) {
        document.getElementById('game-message').textContent = "You win!";
    } else if (playerScore < dealerScore) {
        document.getElementById('game-message').textContent = "Dealer wins!";
    } else {
        document.getElementById('game-message').textContent = "It's a tie!";
    }
}
