require 'database/config'
require 'exceptions'

module Services
  module KitchenPoints
    class ClientException < Exceptions::ClientException
    end

    KITCHEN_POINTS_DB = DB[:kitchen_points]

    def self.save(kitchen_points)
      KITCHEN_POINTS_DB.insert(kitchen_points)
    end
  end
end
