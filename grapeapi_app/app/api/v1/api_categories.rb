module V1
    class ApiCategories < Grape::API
        format :json

        rescue_from :all do |e|
          error!({ error: "Publisher not found."}, 400)
        end
        
        desc 'Returns all categories'
        get '/categories' do
            categories = Category.all
            present categories
        end

    end
end
