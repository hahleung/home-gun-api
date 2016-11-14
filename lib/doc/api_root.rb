module ApiDoc
  module Root
    include Swagger::Blocks

    swagger_root do
      key :swagger, '2.0'

      security_definition :api_key do
        key :type, :apiKey
        key :name, :api_key
        key :in, :header
      end
      security_definition :petstore_auth do
        key :type, :oauth2
        key :authorizationUrl, 'http://swagger.io/api/oauth/dialog'
        key :flow, :implicit
        scopes do
          key 'write:pets', 'modify pets in your account'
          key 'read:pets', 'read your pets'
        end
      end
    end
  end
end
