require_relative 'dealer'
require_relative 'player'
require_relative 'deck'

class Game
  attr_reader :dealer, :player
  def initialize
    @dealer = Dealer.new
    @player = Player.new
  end

  def start_game
    dealer.deal.each do |card|
      player.cards << card
    end
    player.cards
  end
end
