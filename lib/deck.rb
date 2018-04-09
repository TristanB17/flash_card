class Deck
  attr_reader :cards,
              :count

  def initialize(card_1, card_2, card_3)
    @cards = []
    @cards << card_1
    @cards << card_2
    @cards << card_3
    @count = @cards.size
  end

end
