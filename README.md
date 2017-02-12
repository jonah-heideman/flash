# Jonah's super cool flash card game

Config based command-line trivia game

# Install

clone repo

cd flash

bundle install

# Play (two games provided)

ruby state_capitals.rb

or

ruby rapper_real_names.rb

# Test

cd test
ruby {name_of_class}_test.rb

# Create game

in /config, create a file with the name format {name_of_game}_config.rb

in config file, create a hash constant with the following structure:

NAME_OF_GAME_CONFIG = {

  data: // array of question/answer pairs
  
  predicate: // prefix for each question (optional)
  
  name_of_game: // title of your game 
  
}

in the root dir, create a game runner file with the name format {name_of_game}.rb

in game runner file, enter the following code:

require_relative 'lib/runner'

load 'config/{game_config_file}.rb'

Runner.new(NAME_OF_GAME_CONFIG).run (where NAME_OF_GAME_CONFIG is the variable holding the game config hash)

