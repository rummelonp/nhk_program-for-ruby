# coding: utf-8

require 'nhk_program/client'
require 'nhk_program/configuration'

module NHKProgram
  extend Configuration

  # Alias for NHKProgram::Client.new
  #
  # @return [NHKProgram::Client]
  def self.new(options = {})
    Client.new(options)
  end

  # Delegate to {NHKProgram::Client}
  def self.method_missing(method_name, *args, &block)
    return super unless new.respond_to?(method_name)
    new.send(method_name, *args, &block)
  end

  # Delegate to {NHKProgram::Client}
  def self.respond_to?(method_name, include_private = false)
    return new.respond_to?(method_name, include_private) || super
  end
end
