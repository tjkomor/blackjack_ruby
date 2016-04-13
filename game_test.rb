gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'game'

class GameTest < Minitest::Test
  def test_dealer_can_deal_cards_to_player
    game = Game.new
    game.start_game

    assert_equal 2, game.player.cards.count
    assert_equal 2, game.dealer.cards.count
    assert_equal 48, game.dealer.deck.cards.count
  end

  def test_dealer_can_deal_different_cards_to_player_and_self
    game = Game.new
    assert_equal 52, game.dealer.deck.cards.count

    game.start_game

    assert_equal 48, game.dealer.deck.cards.count
    refute_equal game.player.cards.first, game.dealer.cards.first
  end

  def test_player_can_hit
    game = Game.new
    game.start_game
    game.player_hits

    assert_equal 3, game.player.cards.count
  end
end
