module V1
    class ApiBooks < Grape::API
        format :json

        rescue_from :all do |e|
          error!({ error: e.message}, 400)
        end
        
        desc 'Returns all books'
        get '/books' do
            books = Book.all
            present books
        end

        desc 'Retrieve book [by ID]'
        params do
          requires :id, type: Integer, desc: 'Book ID.'
        end
        get '/books/:id' do
          book = Book.find(params[:id])
          raise NotFoundError if book.nil?
          # https://stackoverflow.com/questions/3462754/rails-object-relationships-and-json-rendering
          book.as_json(:include => [:publisher  => { :only => :name }, 
                                    :categories => { :only => :name } ])
        end

        desc 'Creates new book'
        post '/books' do
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
        
        desc 'Updates book'
        params do
          requires :id, type: Integer, desc: 'Book ID.'
        end
        put '/books/:id' do
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

        desc 'Deletes book'
        params do
          requires :id, type: Integer, desc: 'Book ID.'
        end
        delete '/books/:id' do
          book = Book.find(params[:id])
          raise NotFoundError if book.nil?
          book.destroy!
        end

        desc 'Book search using Google API'
        params do
          optional :q, type: String, desc: 'Query Search parameter.'
        end
        get '/books/search/:q' do
          if params[:q].present?
            # https://github.com/visoft/google_books
            books = GoogleBooks::API.search(params[:q])
            raise NotFoundError if books.nil?
            present books            
          else
            # without query param returns http 400
            error!
          end
        end

    end
end
