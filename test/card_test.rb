gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require '../lib/card'

class CardTest < Minitest::Test
  def test_card
    q    = 'question'
    a    = 'answer'
    card = Card.new(q, a)
    assert card.question == q
    assert card.answer   == a
  end
end