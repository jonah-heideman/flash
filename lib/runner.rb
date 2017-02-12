require_relative 'deck'
require_relative 'round'
require_relative 'card'

class Runner
  def initialize(config)
    @data = config[:data]
    @predicate = config[:predicate] || ''
    @game_name = config[:game_name]
    @deck = Deck.new(init_cards.shuffle)
    @round = Round.new(@deck)
  end

  def init_cards
    @data.map do |line|
      question, answer = line
      Card.new(question, answer)
    end
  end

  def run
    puts "#{@game_name} (#{@deck.count} questions)"
    ask_question until @round.should_stop?
    puts "Game over! Your score is #{@round.percent_correct}%"
  end

  def ask_question
    puts "\n" + "#{@predicate} #{@round.current_card.question}?".strip
    guess = @round.record_guess(gets.chomp)
    puts guess.feedback
  end

end