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
  end
end
