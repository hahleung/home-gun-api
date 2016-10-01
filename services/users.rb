require 'database/config'

module Services
  module Users
    USERS_DB = DB[:users]

    def self.save(name)
      USERS_DB.insert(name: name)
    end
  end
end
