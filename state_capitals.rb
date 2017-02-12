require_relative 'lib/runner'
load 'config/state_capitals_config.rb'

Runner.new(STATE_CAPITALS_CONFIG).run