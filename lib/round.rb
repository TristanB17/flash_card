class Round
  attr_reader   :deck,
                :guesses

  def initialize(deck)
    @deck = deck
    @guesses = []
  end

  def current_card
    @current_card = @deck.cards.shift
  end

  def record_guess(guess)
    record_guess = Guess.new(guess, @current_card)
    @guesses << record_guess
    record_guess
  end

  def number_correct
    number_right = 0
    @guesses.each do |guess|
      if guess.correct?
        number_right += 1
      end
    end
    number_right
  end

end
