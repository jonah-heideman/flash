require_relative 'lib/runner'
load 'config/rapper_real_names_config.rb'

Runner.new(RAPPER_REAL_NAMES_CONFIG).run