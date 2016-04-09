gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'

class DealerTest

  def test_dealer_can_deal_cards_to_player
    dealer = Dealer.new
    dealer.deal

    assert_equal 2, player.cards.count
  end
end
