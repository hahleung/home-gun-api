require 'bundler/setup'
require 'sinatra'
require 'json'
require 'pry'

$LOAD_PATH << __dir__
require 'services/users'

set :port, 3000

post '/users' do
  name = JSON.parse(request.body.read)["name"]
  if name
    Services::Users.save(name)
    status 201
  else
    status 400
    body "Require a name parameter"
  end
end
