require 'bundler/setup'
require 'sequel'

DB = Sequel.connect('postgres://homegun:pass@192.168.99.101:5431/homegun')

DB.create_table :users do
  primary_key :id
  String :name
end

require 'sinatra'

get '/' do
  'cool'
end



