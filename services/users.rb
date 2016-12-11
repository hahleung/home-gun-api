require 'database/config'
require 'exceptions'

module Services
  module Users
    class ClientException < Exceptions::ClientException
    end

    USERS_DB = DB[:users]

    def self.save(name)
      raise ClientException.new("Require a name") unless name
      USERS_DB.insert(name: name)
    rescue Sequel::UniqueConstraintViolation
      raise ClientException.new("Duplicate name #{name}")
    end
  end
end
