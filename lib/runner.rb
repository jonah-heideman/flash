require_relative 'deck'
require_relative 'round'
require_relative 'card'
require_relative 'guess'

class Runner

  def initialize(config)
    @data      = config[:data]
    @predicate = config[:predicate] || ''
    @game_name = config[:game_name]
    @deck      = Deck.new(init_cards.shuffle)
    @round     = Round.new(@deck)
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
    puts "\nGame over! Your score is #{@round.percent_correct}% (#{@round.number_correct} correct answer(s))"
  end

  def ask_question
    puts "\n" + "#{@predicate} #{@round.current_card.question}?".strip
    guess = Guess.new(gets.chomp, @round.current_card)
    @round.record_guess(guess)
    puts guess.feedback
  end

end