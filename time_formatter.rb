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
    return unless @formats
    formats_array = @formats.split(',')
    formats_array.each do |i|
      TIME_FORMAT.include?(i.to_sym) ? @correct_formats.push(i) : @unknown_formats.push(i)
    end
  end

  def unknown_formats?
    unknown_formats.any?
  end

  def time_now
    symbols_array = []
    TIME_FORMAT.each do |key, value|
      @correct_formats.each do |i|
        symbols_array << value if i.to_sym == key
      end
    end
    Time.now.strftime(symbols_array.join('-'))
  end
end
