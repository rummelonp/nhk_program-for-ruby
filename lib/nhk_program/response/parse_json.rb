# coding: utf-8

require 'faraday_middleware/response_middleware'
require 'multi_json'

module NHKProgram
  # @private
  module Response
    # @private
    class ParseJson < FaradayMiddleware::ResponseMiddleware
      define_parser do |body|
        MultiJson.load(body) if body
      end
    end
  end
end
