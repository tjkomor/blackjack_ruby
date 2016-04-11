require_relative 'deck'
require_relative 'player'

class Dealer
  def initialize
    @deck = Deck.new
    @player = Player.new
  end

  def deal
    
  end
end
