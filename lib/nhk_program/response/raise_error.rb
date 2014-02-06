# coding: utf-8

require 'faraday'
require 'nhk_program/error'

module NHKProgram
  # @private
  module Response
    # @private
    class RaiseError < Faraday::Response::Middleware
      def on_complete(env)
        case env[:status].to_i
        when 400
          raise NHKProgram::BadRequest, error_message(env)
        when 401
          raise NHKProgram::NotAuthorized, error_message(env)
        when 403
          raise NHKProgram::Forbidden, error_message(env)
        when 404
          raise NHKProgram::NotFound, error_message(env)
        when 400...500
          raise NHKProgram::ClientError, error_message(env)
        when 500
          raise NHKProgram::InternalServerError, error_message(env)
        when 503
          raise NHKProgram::ServiceUnavailable, error_message(env)
        when 500...600
          raise NHKProgram::ServerError, error_message(env)
        end
      end

      private

      def error_message(env)
        body = env[:body]
        if body.nil?
          nil
        elsif body['error'] && body['error']['message']
          body['error']['message']
        elsif body['fault'] && body['fault']['faultstring']
          body['fault']['faultstring']
        end
      end
    end
  end
end
