require 'minitest/autorun'
require 'minitest/pride'
require './lib/guess'
require './lib/card'
require 'pry'

class GuessTest  < Minitest::Test

  def test_it_exists
    card = Card.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Juneau", card)
    assert_equal Card, guess.card.class
    assert_equal "What is the capital of Alaska?", guess.card.question
    assert_equal "Juneau", guess.response
    assert_equal true, guess.correct?
    assert_equal "Correct!", guess.feedback
  end

  def test_it_can_view_other_cards

  end





end
