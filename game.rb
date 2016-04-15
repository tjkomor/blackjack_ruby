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

  def check_bust
    player_score > 21
  end

  def check_score
    if check_bust || player_score < dealer_score
      "You lose, loser."
    else
      "You Win!"
    end
  end

  def check_dealer_hand
    dealer.cards.last[1] >= 7
  end

  def player_hit_option
    if check_dealer_hand
      until player_score >= 17 
        player_hits
      end
    end
  end

  def dealer_hit_option
    until dealer_score >= 17
      dealer_hits
    end
  end
end
