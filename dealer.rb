require_relative 'deck'

class Dealer
  def initialize
    @deck = Deck.new
  end

  def deal
    [1,2]
  end
end
