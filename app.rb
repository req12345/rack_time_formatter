# frozen_string_literal: true
require 'byebug'
class App
  PATH_TIME = '/time'
  HEADER = { 'Content-Type' => 'text/plain' }.freeze
  STATUS_OK = 200
  STATUS_NOT_FOUND = 404
  STATUS_UNKNOWN = 400

  def call(env)
    request = Rack::Request.new(env)
    request_path = request.path
    request_params = request.params

    return create_response(['Request path not started by /time'], STATUS_NOT_FOUND, HEADER) if request_path != PATH_TIME

    if request_params[:format].nil? || request_params == ['']
      return create_response(['Enter format value'], STATUS_UNKNOWN, HEADER)
    end

    time_formatter = TimeFormatter.new(request_params)

    time_formatter.check_formats

    if time_formatter.unknown_formats?
      return create_response(["Unknown time format #{time_formatter.unknown_formats}"], STATUS_UNKNOWN, HEADER)
    end

    create_response([time_formatter.time_now.to_s], STATUS_OK, HEADER)
  end

  private

  def create_response(body, status, headers)
    Rack::Response.new(body, status, headers).finish
  end
end
