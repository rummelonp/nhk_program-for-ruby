# coding: utf-8

module NHKProgram
  module API
    # Get program list
    #
    # @param area [Area, Symbol, String] Area ID (3 bytes)
    # @param service [Service, Symbol, String] Service ID (2 bytes)
    # @param date [Date, Symbol, String] Today or tomorrow
    # @return [Hashie::Mash]
    def list(area, service, date = Date.today)
      area = parse_area(area)
      service = parse_service(service)
      date = parse_date(date)
      get("list/#{area.id}/#{service.id}/#{date.to_s}.json")
    end

    # Get program list by genre
    #
    # @param area [Area, Symbol, String] Area ID (3 bytes)
    # @param service [Service, Symbol, String] Service ID (2 bytes)
    # @param genre [Genre, Symbol, String] Genre ID (4 bytes)
    # @param date [Date, Symbol, String] Today or tomorrow
    # @return [Hashie::Mash]
    def genre(area, service, genre, date = Date.today)
      area = parse_area(area)
      service = parse_service(service)
      genre = parse_genre(genre)
      date = parse_date(date)
      get("genre/#{area.id}/#{service.id}/#{genre.id}/#{date.to_s}.json")
    end

    # Get program information
    #
    # @param area [Area, Symbol, String] Area ID (3 bytes)
    # @param service [Service, Symbol, String] Service ID (2 bytes)
    # @param id [String] Program ID (13 bytes)
    # @return [Hashie::Mash]
    def info(area, service, id)
      area = parse_area(area)
      service = parse_service(service)
      get("info/#{area.id}/#{service.id}/#{id.to_s}.json")
    end

    # Get information of program that is on air now
    #
    # @param area [Area, Symbol, String] Area ID (3 bytes)
    # @param service [Service, Symbol, String] Service ID (2 bytes)
    # @return [Hashie::Mash]
    def now(area, service)
      area = parse_area(area)
      service = parse_service(service)
      get("now/#{area.id}/#{service.id}.json")
    end
  end
end
