gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require '../lib/card'
require '../lib/deck'

class DeckTest < Minitest::Test

  def test_deck
    cards = [
        Card.new('question1', 'answer1'),
        Card.new('question2', 'answer2'),
        Card.new('question3', 'answer3')
    ]
    deck  = Deck.new(cards)
    assert deck.cards == cards
    assert deck.count == cards.length
  end
end
