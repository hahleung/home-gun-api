require 'bundler/setup'
require 'sinatra'
require 'sinatra/json'
require 'json'

require 'exceptions'
require 'services/kitchen_points'
require 'services/users'
require 'parsers/json'
require 'parsers/kitchen_points'

set :port, 3000

post '/users' do
  begin
    name = Json.parse(request.body.read)["name"]
    Services::Users.save(name)
    status 201
  rescue Exceptions::ClientException => error
    status 400
    json message: error.message
  end
end

get '/users' do
  users = Services::Users.get_all
  status 200
  json users
end

post '/kitchen_points' do
  kitchen_points = Parsers::KitchenPoints.parse(request.body.read)
  Services::KitchenPoints.save(kitchen_points)
  status 201
  #TODO: errors - parsing keys
  #TODO: errors - validity of keys
  #TODO: errors - validity of values
  #TODO: errors - user ID exists?
end

helpers Parsers::Json
