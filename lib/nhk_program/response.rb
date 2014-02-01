# coding: utf-8

require 'faraday'
require 'nhk_program/response/parse_json'

Faraday.register_middleware :response,
  json: -> { NHKProgram::Response::ParseJson }
