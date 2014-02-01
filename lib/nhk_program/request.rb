# coding: utf-8

require 'cgi'

module NHKProgram
  module Request
    # Perform an HTTP GET request
    def get(path, params = {})
      request(:get, path, params)
    end

    # Perform an HTTP request
    def request(http_method, path, params = {})
      path = "#{path}?key=#{CGI.escape(api_key.to_s)}" if api_key
      response = connection.send(http_method) do |request|
        request.url(path, params)
      end

      response.body
    end
  end
end
