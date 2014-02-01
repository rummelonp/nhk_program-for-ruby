# coding: utf-8

require 'faraday'
require 'faraday_middleware'
require 'nhk_program/response'

module NHKProgram
  module Connection
    def connection(options = {})
      default_options = {
        headers: {
          accept: 'application/json',
          user_agent: user_agent,
        },
        proxy: proxy,
      }

      options = default_options.merge(options)

      Faraday::Connection.new(endpoint, options) do |builder|
        builder.response :raise_error
        builder.response :mashify
        builder.response :json
        builder.request :url_encoded
        builder.adapter adapter
      end
    end
  end
end
