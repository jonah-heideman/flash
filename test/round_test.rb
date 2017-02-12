gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require '../lib/card'
require '../lib/deck'
require '../lib/round'
require '../lib/guess'

class RoundTest < Minitest::Test
  def test_round
    cards = [
        Card.new('question1', 'answer1'),
        Card.new('question2', 'answer2')
    ]
    deck  = Deck.new(cards)
    round = Round.new(deck)
    assert_equal [], round.guesses
    assert_equal cards.first, round.current_card
    assert_equal 'answer1', round.record_guess(Guess.new('answer1', round.current_card)).response
    assert_equal 1, round.guesses.count
    assert_equal 'Correct!', round.guesses.first.feedback
    assert_equal 1, round.number_correct
    assert_equal cards[1], round.current_card
    assert_equal 'wrong', round.record_guess(Guess.new('wrong', round.current_card)).response
    assert_equal 2, round.guesses.count
    assert round.guesses.last.feedback.include? 'Incorrect'
    assert_equal 1, round.number_correct
    assert_equal 50, round.percent_correct
  end
end