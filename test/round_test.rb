require 'minitest/autorun'
require 'minitest/pride'
require './lib/guess'
require './lib/card'
require './lib/deck'
require './lib/round'
require 'pry'

class RoundTest < Minitest::Test

  def test_it_exists
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    assert_instance_of Round, round
    assert_instance_of Deck, round.deck
  end

  def test_guesses_begins_empty
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    assert_equal [], round.guesses
  end

  def test_it_can_hold_cards
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    assert_equal card_1, round.current_card
  end

  def test_it_can_record_and_count_guesses
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    assert_equal card_1, round.current_card
    assert_instance_of Guess, round.record_guess("Juneau")
    assert_equal 1, round.guesses.count
  end

  def test_it_can_record_number_of_correct_guesses
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    assert_equal card_1, round.current_card
    assert_instance_of Guess, round.record_guess("Juneau")
    assert_equal 1, round.guesses.count
    assert_equal 1, round.number_correct
  end

  def test_it_returns_feedback
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    assert_equal card_1, round.current_card
    assert_instance_of Guess, round.record_guess("Juneau")
    assert_equal "Correct!", round.guesses.first.feedback
  end

  def test_it_can_cycle_through_cards
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    assert_equal card_1, round.current_card
    assert_instance_of Guess, round.record_guess("Juneau")
    assert_equal card_2, round.current_card
    assert_instance_of Guess, round.record_guess("2")
  end

  def test_it_can_count_and_give_feedback_on_new_cards
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    assert_equal card_1, round.current_card
    assert_instance_of Guess, round.record_guess("Juneau")
    assert_equal "Correct!", round.guesses.first.feedback
    assert_equal card_2, round.current_card
    assert_instance_of Guess, round.record_guess("2")
    assert_equal "Incorrect.", round.guesses.last.feedback
    assert_equal 2, round.guesses.count
    assert_equal 1, round.number_correct
  end

  def test_it_can_get_percentage_of_correct_guesses
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    assert_equal card_1, round.current_card
    assert_instance_of Guess, round.record_guess("Juneau")
    assert_equal "Correct!", round.guesses.first.feedback
    assert_equal card_2, round.current_card
    assert_instance_of Guess, round.record_guess("2")
    assert_equal 2, round.guesses.count
    assert_equal 50, round.percent_correct
  end
end
