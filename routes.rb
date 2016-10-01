require 'bundler/setup'
require 'sequel'

DB = Sequel.connect('postgres://homegun:pass@192.168.99.101:5431/homegun')

require 'sinatra'

get '/' do
  'cool'
end
