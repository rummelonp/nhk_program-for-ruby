# coding: utf-8

module NHKProgram
  module API
    def list(area, service, date = Date.today)
      area = parse_area(area)
      service = parse_service(service)
      date = parse_date(date)
      get("list/#{area.id}/#{service.id}/#{date.to_s}.json")
    end

    def genre(area, service, genre, date = Date.today)
      area = parse_area(area)
      service = parse_service(service)
      genre = parse_genre(genre)
      date = parse_date(date)
      get("genre/#{area.id}/#{service.id}/#{genre.id}/#{date.to_s}.json")
    end

    def info(area, service, id)
      area = parse_area(area)
      service = parse_service(service)
      get("info/#{area.id}/#{service.id}/#{id.to_s}.json")
    end

    def now(area, service)
      area = parse_area(area)
      service = parse_service(service)
      get("now/#{area.id}/#{service.id}.json")
    end
  end
end
