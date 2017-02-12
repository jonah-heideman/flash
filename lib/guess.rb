class Guess

  attr_reader :card

  def initialize(guess, card)
    @card  = card
    @guess = guess
  end

  def response
    @guess
  end

  def correct?
    return false if @guess.empty?
    @guess.downcase.include? @card.answer.downcase
  end

  def feedback
    correct? ? "Correct!" : "Incorrect. The answer is: #{@card.answer}"
  end

end