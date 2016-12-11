require 'json'
require 'exceptions'

module Parsers
  module Json
    def self.parse(input)
      JSON.parse(input)
    rescue JSON::ParserError => error
      raise Exceptions::ClientException.new(
        "Error while parsing JSON: " + error.message
      )
    end
  end
end
