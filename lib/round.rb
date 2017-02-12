require_relative 'guess'

class Round

  attr_reader :guesses

  def initialize(deck)
    @deck          = deck
    @guesses       = []
    @current_index = 0
  end

  def current_card
    @deck.cards[@current_index]
  end

  def record_guess(guess_input)
    guess = Guess.new(guess_input, current_card)
    @guesses.push(guess)
    @current_index += 1
    guess
  end

  def number_correct
    @guesses.find_all(&:correct?).length
  end

  def percent_correct
    ((number_correct.to_f / @guesses.length.to_f) * 100).to_i
  end

  def should_stop?
    @guesses.length == @deck.count
  end

end