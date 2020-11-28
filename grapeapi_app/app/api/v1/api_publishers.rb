module V1
    class ApiPublishers < Grape::API
        format :json

        rescue_from :all do |e|
          error!({ error: "Publisher not found."}, 400)
        end
        
        desc 'Returns all publishers'
        get '/publishers' do
            publishers = Publisher.all
            present publishers
        end

    end
end
