# coding: utf-8

module NHKProgram
  class Enumeration
    attr_reader :id
    attr_reader :name

    # Find enumerable object by bame
    #
    # @param id [Symbol, String]
    # @return [Enumeration]
    def self.find_by_id(id)
      mappings[id.to_s]
    end

    # Find enumerable object by bame
    #
    # @param name [Symbol, String]
    # @return [Enumeration]
    def self.find_by_name(name)
      name = name.to_s
      mappings.values.find do |value|
        value.name == name
      end
    end

    # @private
    def self.mappings
      @mappings ||= {}
    end
    private_class_method :mappings

    # @private
    def self.define(id, name)
      id, name = id.to_s, name.to_s
      instance = new
      instance.instance_variable_set(:@id, id)
      instance.instance_variable_set(:@name, name)
      mappings[id] = instance
    end
    private_class_method :define
  end
end
