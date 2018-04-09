require 'minitest/autorun'
require 'minitest/pride'
require './lib/card.rb'
require 'pry'

class CardTest < Minitest::Test

  def test_it_exists
    card = Card.new("What's the capital of Alaska?", "Juneau")
    assert_instance_of Card, card
    assert_equal "What's the capital of Alaska?", card.question
    assert_equal "Juneau", card.answer
  end



end
