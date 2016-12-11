require 'parsers/json'
require 'date'

module Parsers
  module KitchenPoints
    def self.parse(input)
      initial = Json.parse(input)
      date = Date.parse(initial.fetch("date"))
      initial.merge("date" => date)
    end
  end
end
