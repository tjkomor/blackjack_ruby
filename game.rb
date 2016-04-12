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
    dealer.deal_to_player.each do |card|
      player.cards << card
    end
    dealer.deal_to_self.each do |card|
      dealer.cards << card
    end
  end
end
