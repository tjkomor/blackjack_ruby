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
    refute_equal game.player.cards.first, game.dealer.cards.last
    refute_equal game.player.cards.last, game.dealer.cards.first
    refute_equal game.player.cards.last, game.dealer.cards.last
  end

  def test_player_can_hit
    game = Game.new
    game.start_game
    game.player_hits

    assert_equal 3, game.player.cards.count
    assert_equal 47, game.dealer.deck.cards.count
  end

  def test_dealer_can_hit
    game = Game.new
    game.start_game
    game.dealer_hits

    assert_equal 3, game.dealer.cards.count
    assert_equal 47, game.dealer.deck.cards.count
  end

  def test_player_and_dealer_can_both_hit
    game = Game.new
    game.start_game
    game.player_hits
    game.dealer_hits

    assert_equal 3, game.dealer.cards.count
    assert_equal 3, game.player.cards.count
    assert_equal 46, game.dealer.deck.cards.count
  end

  def test_player_wins_if_score_is_higher_than_dealer
    game = Game.new
    game.start_game

    if game.dealer_score < game.player_score
      assert_equal "You Win!", game.check_score
    end
  end

  def test_player_loses_if_score_is_lower_than_dealer
    game = Game.new
    game.start_game

    if game.dealer_score > game.player_score
      assert_equal "You lose, loser.", game.check_score
    end
  end

  def test_player_hits_if_dealer_is_showing_winning_hand
    game = Game.new
    game.start_game

    if game.dealer.cards.last[1] > 6 && game.player_score < 16
      game.player_hit_option
      assert game.player.cards.count < 48
    end
  end

  def test_dealer_continues_to_hit_until_score_is_greater_than_17
    game = Game.new
    game.start_game

    if game.dealer_score < 17
      game.dealer_hit_option
      assert game.dealer.cards.count < 48
    end
  end

  def test_player_wins_if_dealer_busts

  end
end
