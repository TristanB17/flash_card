

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

  def percent_correct
    ((number_correct.to_f/@guesses.length.to_f) * 100).to_i
  end

  def start
    puts "Welcome! You're playing with #{@deck.cards.length} cards."
    puts "-----------------------------------------------------------------"
    @deck.cards.each_with_index do |card, index|
      puts card.question
      reply = gets.chomp
      guess = record_guess(reply)
      puts guess.feedback
    end
  end

end
