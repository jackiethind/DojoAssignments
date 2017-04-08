function deck () {
    this.buildDeck();
}
deck.prototype.buildDeck = function () {
    var suits = ["diamonds","clubs","hearts","spades"];
    var values = ["ace","2","3","4","5","6","7","8","9","10","jack","queen","king"];
    var _this = this;

    _this.cards = [];

    suits.forEach(function(suit) {
        values.forEach(function(value) {
            _this.cards.push(new card(value, suit));
        });
    });
    return this;
};
deck.prototype.shuffle = function () {
    var unshuffledEdge = this.cards.length;
    var cardToShuffleIdx;
    var temp;

    while (unshuffledEdge > 0) {
        cardToShuffleIdx = Math.floor(Math.random()*unshuffledEdge);
        unshuffledEdge -= 1;

        temp = this.cards[cardToShuffleIdx];
        this.cards[cardToShuffleIdx] = this.cards[unshuffledEdge];
        this.cards[unshuffledEdge] = temp;
    }
    return this;

};

deck.prototype.reset = function () {
    this.buildDeck().shuffle();
};

deck.prototype.dealRandomCard = function () {
    // terenary operator, if both if and else are returning something
    // used as an if condition (? is then) then pop, else (:) return null
    return (this.cards.length > 0) ? this.cards.pop() : null;
};

function card (value, suit) {
    this.value = value;
    this.suit = suit;
}

function player(name) {
    this.name = name;
    this.hand = [];
}

player.prototype.takeCard = function (deck) {
    this.hand.push(deck.dealRandomCard());
};

player.prototype.discard = function (cardIdx) {
    if(this.hard.length > cardIdx) {
        this.hand.splice(cardIdx,1);
    }
    return this;
};

var myDeck = new deck();
console.log(myDeck.cards);
myDeck.shuffle();
console.log(myDeck.cards);
