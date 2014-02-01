# coding: utf-8

module NHKProgram
  class Enumeration
    attr_reader :id
    attr_reader :name

    def self.define(id, name)
      id, name = id.to_s, name.to_s
      instance = new
      instance.instance_variable_set(:@id, id)
      instance.instance_variable_set(:@name, name)
      mappings[id] = instance
    end

    def self.find_by_id(id)
      mappings[id.to_s]
    end

    def self.find_by_name(name)
      name = name.to_s
      mappings.values.find do |value|
        value.name == name
      end
    end

    def self.mappings
      @mappings ||= {}
    end

    private_class_method :mappings
  end
end
