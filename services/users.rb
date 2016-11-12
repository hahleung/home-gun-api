require 'database/config'

module Services
  module Users
    class ClientException < Exception
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
