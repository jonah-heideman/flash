gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require '../lib/guess'
require '../lib/card'

class GuessTest < Minitest::Test

  def test_incorrect_guess
    card  = Card.new('question', 'answer')
    guess = Guess.new('wrong answer', card)
    assert guess.card == card
    assert guess.response == 'wrong answer'
    assert !guess.correct?
    assert guess.feedback.include? 'Incorrect'
  end

  def test_correct_guess
    card  = Card.new('question', 'answer')
    guess = Guess.new('answer', card)
    assert guess.card == card
    assert guess.response == 'answer'
    assert guess.correct?
    assert guess.feedback == 'Correct!'
  end

  def test_guess_is_case_insensitive
    card  = Card.new('question', 'answer')
    guess = Guess.new('aNSWeR', card)
    assert guess.card == card
    assert guess.response == 'aNSWeR'
    assert guess.correct?
    assert guess.feedback == 'Correct!'
  end

end