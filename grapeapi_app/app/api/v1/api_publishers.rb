module V1
    class ApiPublishers < Grape::API
        format :json

        rescue_from :all do |e|
          error!({ error: "Publisher not found."}, 400)
        end

        # helpers do
        #     def publisher_params(params)
        #       {
        #         name:       params[:name],
        #         book_id:    params[:book_id]
        #       }
        #     end
        # end
        
        desc 'Returns all publishers'
        get '/publishers' do
            publishers = Publisher.all
            present publishers
        end

        # desc 'Retrieve publisher [by ID]'
        # params do
        #   requires :id, type: Integer, desc: 'Book ID.'
        # end
        # get '/publishers/:id' do
        #   publishers = Publisher.find(params[:id])
        #   raise NotFoundError if publishers.nil?
        #   present publishers
        # end

        # desc 'Creates new publisher'
        # params do
        #   requires :name,       type: String
        #   requires :book_id,    type: Integer
        # end
        # post '/publishers' do
        #     Publisher.create!(publisher_params(params))
        # end
        
        # desc 'Updates publisher'
        # params do
        #   requires :id,         type: Integer
        #   requires :name,       type: String
        #   requires :book_id,    type: Integer
        # end
        # put '/publishers' do
        #   publishers = Publisher.find(params[:id])
        #   raise NotFoundError if publishers.nil?
        #   publishers.update_attributes!(publisher_params(params))
        # end

        # desc 'Deletes publisher'
        # params do
        #   requires :id, type: Integer
        # end
        # delete '/publishers/:id' do
        #   publishers = Publisher.find(params[:id])
        #   raise NotFoundError if publishers.nil?
        #   publishers.destroy!
        # end

    end
end
