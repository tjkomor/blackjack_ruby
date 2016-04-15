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

  def player_hits
    player.cards << dealer.deal_player_hit
  end

  def dealer_hits
    dealer.cards << dealer.deal_own_hit
  end

  def dealer_score
    dealer.cards.flatten.select { |card| card.class == Fixnum }.reduce(:+)
  end

  def player_score
    player.cards.flatten.select { |card| card.class == Fixnum }.reduce(:+)
  end

  def check_score
    if player_score < 21 && player_score < dealer_score
      "You Win!"
    else
      "You loser, loser."
    end
  end
end
