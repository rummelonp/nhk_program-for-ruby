# coding: utf-8

require 'nhk_program/api'
require 'nhk_program/configuration'
require 'nhk_program/connection'
require 'nhk_program/helper'
require 'nhk_program/request'

module NHKProgram
  class Client
    include Connection
    include Request
    include API
    include Helper

    # @private
    attr_accessor *Configuration::VALID_OPTIONS_KEYS

    def initialize(options = {})
      options = NHKProgram.options.merge(options)
      Configuration::VALID_OPTIONS_KEYS.each do |key|
        send("#{key}=", options[key])
      end
    end
  end
end
