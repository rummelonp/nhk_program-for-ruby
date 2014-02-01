# coding: utf-8

require 'faraday'
require 'nhk_program/response/parse_json'
require 'nhk_program/response/raise_error'

Faraday.register_middleware :response,
  json:        -> { NHKProgram::Response::ParseJson },
  raise_error: -> { NHKProgram::Response::RaiseError }
