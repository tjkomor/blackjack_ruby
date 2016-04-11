gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'dealer'

class DealerTest

  def test_dealer_can_deal_cards_to_player
    game = Game.new
    game.dealer.deal

    assert_equal 2, game.player.cards.count
  end
end
