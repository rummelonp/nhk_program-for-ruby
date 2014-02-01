# coding: utf-8

module NHKProgram
  # Custom error class for rescuing from all NHK Program errors
  Error = Class.new(StandardError)

  # Raised when NHK Program returns the HTTP status code 4xx
  ClientError = Class.new(Error)

  # Raised when NHK Program returns the HTTP status code 400
  BadRequest = Class.new(ClientError)

  # Raised when NHK Program returns the HTTP status code 401
  NotAuthorized = Class.new(ClientError)

  # Raised when NHK Program returns the HTTP status code 403
  Forbidden = Class.new(ClientError)

  # Raised when NHK Program returns the HTTP status code 404
  NotFound = Class.new(ClientError)

  # Raised when NHK Program returns the HTTP status code 5xx
  ServerError = Class.new(Error)

  # Raised when NHK Program returns the HTTP status code 500
  InternalServerError = Class.new(ServerError)

  # Raised when NHK Program returns the HTTP status code 3
  ServiceUnavailable = Class.new(ServerError)
end
