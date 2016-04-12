class Deck
  attr_reader :cards
  def initialize
    @cards = { "2 of Hearts" => 2, "3 of Hearts" => 3, "4 of Hearts" => 4, "5 of Hearts" => 5,
    "6 of Hearts" => 6, "7 of Hearts" => 7, "8 of Hearts" => 8, "9 of Hearts" => 9,
    "10 of Hearts" => 10, "J of Hearts" => 10, "Q of Hearts" => 10, "K of Hearts" => 10,
    "A of Hearts" => 11, "2 of Spades" => 2, "3 of Spades" => 3, "4 of Spades" => 4,
    "5 of Spades" => 5, "6 of Spades" => 6, "7 of Spades" => 7, "8 of Spades" => 8,
    "9 of Spades" => 9, "10 of Spades" => 10, "J of Spades" => 10, "Q of Spades" => 10, "K of Spades" => 10,
    "A of Spades" => 11, "2 of Diamonds" => 2, "3 of Diamonds" => 3, "4 of Diamonds" => 4, "5 of Diamonds" => 5,
    "6 of Diamonds" => 6, "7 of Diamonds" => 7, "8 of Diamonds" => 8, "9 of Diamonds" => 9,
    "10 of Diamonds" => 10, "J of Diamonds" => 10, "Q of Diamonds" => 10, "K of Diamonds" => 10,
    "A of Diamonds" => 11, "2 of Clubs" => 2, "3 of Clubs" => 3, "4 of Clubs" => 4, "5 of Clubs" => 5,
    "6 of Clubs" => 6, "7 of Clubs" => 7, "8 of Clubs" => 8, "9 of Clubs" => 9,
    "10 of Clubs" => 10, "J of Clubs" => 10, "Q of Clubs" => 10, "K of Clubs" => 10,
    "A of Clubs" => 11 }
  end
end
