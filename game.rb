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
    dealer_first_two_cards
    player_first_two_cards
  end

  def dealer_first_two_cards
    dealer.deal_to_self.each do |card|
      dealer.cards << card
    end
  end

  def player_first_two_cards
    dealer.deal_to_player.each do |card|
      player.cards << card
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

  def player_busts?
    player_score > 21
  end

  def dealer_beats_player?
    dealer_score > player_score && dealer_score < 22
  end

  def player_tied_dealer?
    player_score == dealer_score
  end

  def outcome
    if player_busts? || dealer_beats_player?
      "You lose, loser."
    elsif player_tied_dealer?
      "Push"
    else
      "You Win!"
    end
  end

  def dealer_show_card
    dealer.cards.last[1]
  end

  def player_hit_option
    if dealer_show_card >= 7
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

  def dealer_busted?
    dealer_hit_option
    if dealer_score > 21
      "You Win!"
    end
  end
end
