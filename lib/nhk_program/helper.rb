# coding: utf-8

require 'date'
require 'nhk_program/area'
require 'nhk_program/error'
require 'nhk_program/genre'
require 'nhk_program/service'

module NHKProgram
  module Helper
    # @return [Area]
    # @raise [Error]
    def parse_area(area)
      Area.find_by_id(area) or
        Area.find_by_name(area) or
        raise Error, 'Area not found'
    end

    # @return [Service]
    # @raise [Error]
    def parse_service(service)
      Service.find_by_id(service) or
        Service.find_by_name(service) or
        raise Error, 'Service not found'
    end

    # @return [Genre]
    # @raise [Error]
    def parse_genre(genre)
      Genre.find_by_id(genre) or
        Genre.find_by_name(genre) or
        raise Error, 'Genre not found'
    end

    # @return [Date]
    # @raise [Error]
    def parse_date(date)
      case date
      when Date
        date
      when Time
        date.to_date
      when String
        Date.parse(date)
      when Symbol
        case date
        when :today
          Date.today
        when :tomorrow
          Date.today + 1
        else
          raise NHKProgram::Error, 'Invalid date'
        end
      else
        raise NHKProgram::Error, 'Invalid date'
      end
    end
  end
end
