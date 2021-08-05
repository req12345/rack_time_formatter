# frozen_string_literal: true

class TimeFormatter
  TIME_FORMAT = { year: '%Y', month: '%m', day: '%d', hour: '%H', minute: '%M', second: '%S' }.freeze

  attr_reader :unknown_formats

  def initialize(request_params)
    @formats = request_params['format']
    @correct_formats = []
    @unknown_formats = []
  end

  def check_formats
    formats_array = @formats.split(',')

    formats_array.each do |param|
      if TIME_FORMAT.include?(param.to_sym)
        @correct_formats.push(TIME_FORMAT[param.to_sym])
      else
        @unknown_formats.push(param)
      end
    end
  end

  def unknown_formats?
    unknown_formats.any?
  end

  def time_now
    Time.now.strftime(@correct_formats.join('-'))
  end
end
