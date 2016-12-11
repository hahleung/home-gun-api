require 'bundler/setup'
require 'sinatra'
require 'sinatra/json'
require 'json'

require 'services/users'
require 'exceptions'

set :port, 3000

post '/users' do
  begin
    name = parse_json(request.body.read)["name"]
    Services::Users.save(name)
    status 201
  rescue Exceptions::ClientException => error
    status 400
    json message: error.message
  end
end

module JsonParser
  def parse_json(input)
    JSON.parse(input)
  rescue JSON::ParserError => error
    raise Exceptions::ClientException.new(
      "Error while parsing JSON: " + error.message
    )
  end
end

helpers JsonParser
