
class API < Grape::API
    # This class will handle the REST mappings
    format :json
    prefix :api
    version 'v1', :path
end
