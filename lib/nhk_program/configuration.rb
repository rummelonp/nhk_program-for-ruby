# coding: utf-8

require 'faraday'
require 'nhk_program/version'

module NHKProgram
  # Defines constants and methods related to configuration
  module Configuration
    # An array of valid keys in the options hash when configuring a {NHKProgram::Client}
    VALID_OPTIONS_KEYS = [
      :adapter,
      :api_key,
      :endpoint,
      :proxy,
      :user_agent
    ].freeze

    # The adapter that will be used to connect if none is set
    #
    # @note The default faraday adapter is Net::HTTP
    DEFAULT_ADAPTER    = Faraday.default_adapter

    # By default, don't set an application api key
    DEFAULT_API_KEY    = nil

    # The endpoint that will be used to connect if none is set
    #
    # @note There is no reason to use any other endpoint at this time
    DEFAULT_ENDPOINT   = 'http://api.nhk.or.jp/v1/pg'.freeze

    # By default, don't use a proxy server
    DEFAULT_PROXY      = nil

    # The user agent that will be sent to the API endpoint if none is set
    DEFAULT_USER_AGENT = "NHKProgram/#{VERSION} (https://github.com/mitukiii/nhk_program)".freeze

    # @private
    attr_accessor *VALID_OPTIONS_KEYS

    # When this module is extended, set all configuration options to their default values
    def self.extended(base)
      base.reset
    end

    # Convenience method to allow configuration options to be set in a block
    def configure
      yield self
      self
    end

    # Create a hash of options and their values
    def options
      VALID_OPTIONS_KEYS.inject({}) do |options, key|
        options.merge!(key => send(key))
      end
    end

    # Reset all configuration options to defaults
    def reset
      self.adapter    = DEFAULT_ADAPTER
      self.api_key    = DEFAULT_API_KEY
      self.endpoint   = DEFAULT_ENDPOINT
      self.proxy      = DEFAULT_PROXY
      self.user_agent = DEFAULT_USER_AGENT
      self
    end
  end
end
