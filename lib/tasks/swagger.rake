require 'swagger/blocks'
require 'json'
require 'pry'

namespace :swagger do
  desc "Generate Swagger documentation"
  task :doc do
    path = File.join(File.dirname(__FILE__), '../doc')
    $LOAD_PATH << path
    require 'api_endpoints.rb'
    require 'api_root.rb'

    SWAGGERED_CLASSES = [ApiDoc::Root, ApiDoc::Endpoints]

    swagger_data = Swagger::Blocks.build_root_json(SWAGGERED_CLASSES)

    File.write(path + "/api_doc.json", swagger_data.to_json)
  end
end
