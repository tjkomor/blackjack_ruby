require_relative 'deck'

class Dealer
  attr_reader :cards, :deck
  def initialize
    @deck = Deck.new
    @cards = []
  end

  def deal_to_player
    player_cards = []
    player_cards << @deck.cards.to_a.shuffle.first
    @deck.cards.delete(player_cards.first[0])
    player_cards << @deck.cards.to_a.shuffle.first
    @deck.cards.delete(player_cards.last[0])
    player_cards
  end

  def deal_to_self
    own_cards = []
    own_cards << @deck.cards.to_a.shuffle.first
    @deck.cards.delete(own_cards.first[0])
    own_cards << @deck.cards.to_a.shuffle.first
    @deck.cards.delete(own_cards.last[0])
    own_cards
  end

  def deal_player_hit
    player_hit = []
    player_hit << @deck.cards.to_a.shuffle.first
    @deck.cards.delete(player_hit.first[0])
    player_hit
  end

  def deal_own_hit
    dealer_hit = []
    dealer_hit << @deck.cards.to_a.shuffle.first
    @deck.cards.delete(dealer_hit.first[0])
    dealer_hit
  end
end
