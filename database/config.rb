require 'sequel'

DB = Sequel.connect("postgres://#{ENV['DB_USER']}:#{ENV['DB_PASSWORD']}@#{ENV['DB_HOST']}:#{ENV['DB_PORT']}/#{ENV['DB_NAME']}")
