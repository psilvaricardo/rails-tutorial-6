module V1
    class ApiBooks < Grape::API
        format :json

        # GET

        desc 'Returns all books'
        get '/books' do
          Rails.logger.debug 'Returns all books'
            books = Book.all
            present books
        end

        desc 'Book search using Google API'
        params do
          optional :q, type: String, desc: 'Query Search parameter.'
        end
        get '/books/search' do
          Rails.logger.debug 'Book search using Google API'
          Rails.logger.debug params

          # https://developers.google.com/books/docs/v1/using#WorkingVolumes
          # https://medium.com/@akramhelil/google-books-api-with-rails-or-ruby-a931cece427a
          url = "https://www.googleapis.com/books/v1/volumes?q=#{params[:q]}&maxResults=15"
          response = HTTParty.get(url)
          result = response.parsed_response
        end

        desc 'Retrieve book [by ID]'
        params do
          requires :id, type: Integer, desc: 'Book ID.'
        end
        get '/books/:id' do
          Rails.logger.debug 'Retrieve book [by ID]'
          book = Book.find(params[:id])
          raise NotFoundError if book.nil?
          # https://stackoverflow.com/questions/3462754/rails-object-relationships-and-json-rendering
          book.as_json(:include => [:publisher  => { :only => :name }, 
                                    :categories => { :only => :name } ])
        end


        # POST

        desc 'Creates new book'
        post '/books' do
          Rails.logger.debug 'Creates new book'
          # Finds the record with the given attributes or 
          # creates it with the attributes if one is not found
          publisher = Publisher.find_or_create_by!({name: params[:publisher][:name]})
          
          book = Book.find_or_initialize_by(
            {
              title:          params[:book][:title],
              description:    params[:book][:description],
              page_count:     params[:book][:page_count],
              publisher_id:   publisher.id
            }
          )

          params[:categories].each do |cat| 
            book.categories << Category.find_or_create_by({:name => cat})
          end
          book.save!

        end

        # PUT
        
        desc 'Updates book'
        params do
          requires :id, type: Integer, desc: 'Book ID.'
        end
        put '/books/:id' do
          Rails.logger.debug 'Updates book'
          # Finds the record with the given attributes or 
          # creates it with the attributes if one is not found
          publisher = Publisher.find_or_create_by!({name: params[:publisher][:name]})

          book = Book.find(params[:id])
           raise NotFoundError if book.nil?
          
          book.update_attributes!(
            {
              title:          params[:book][:title],
              description:    params[:book][:description],
              page_count:     params[:book][:page_count],
              publisher_id:   publisher.id
            }
          )

          if params[:categories].present?
            book.categories.delete_all 

            params[:categories].each do |cat|
              book.categories << Category.find_or_create_by({:name => cat})
            end 

          end
          book.save!
          
        end

        # DELETE

        desc 'Deletes book'
        params do
          requires :id, type: Integer, desc: 'Book ID.'
        end
        delete '/books/:id' do
          Rails.logger.debug 'Deletes book'
          book = Book.find(params[:id])
          raise NotFoundError if book.nil?
          book.destroy!
        end

    end
end
