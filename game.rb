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
    player.cards << dealer.deal_to_player.first
    player.cards << dealer.deal_to_player.last
    dealer.cards << dealer.deal_to_self.first
    dealer.cards << dealer.deal_to_self.last
  end
end
