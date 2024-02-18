# frozen_string_literal: true

require_relative 'middleware/runtime'
require_relative 'time_formatter'
require_relative 'app'

use Runtime
run App.new
