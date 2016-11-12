require 'bundler/setup'
require 'sinatra'
require 'sinatra/json'
require 'json'

require 'services/users'

set :port, 3000

post '/users' do
  name = JSON.parse(request.body.read)["name"]

  begin
    Services::Users.save(name)
    status 201
  rescue Services::Users::ClientException => error
    status 400
    json message: error.message
  end
end
