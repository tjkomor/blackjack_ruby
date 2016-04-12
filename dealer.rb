require_relative 'deck'

class Dealer
  attr_reader :cards
  def initialize
    @deck = Deck.new
    @cards = []
  end

  def deal_to_player
    [1,2]
  end

  def deal_to_self
    [1,2]
  end
end
