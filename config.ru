# frozen_string_literal: true

require_relative 'middleware/runtime'
require_relative 'middleware/app_logger'
require_relative 'time_formatter'
require_relative 'app'

use Runtime
use AppLogger, logdev: File.expand_path('log/app.log', __dir__)

run App.new
