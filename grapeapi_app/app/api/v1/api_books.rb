module V1
    class ApiBooks < Grape::API
        format :json

        helpers do
            def book_params(params)
              {
                title:          params[:title],
                description:    params[:description],
                page_count:     params[:page_count]
              }
            end
        end
        
        desc 'Returns the full list of books'
        get '/books' do
            books = Book.all
            present books
        end

        desc 'Retrieve a book based by ID.'
        params do
          requires :id, type: Integer, desc: 'Book ID.'
        end
        get '/books/:id' do
          book = Book.find(params[:id])
          raise NotFoundError if book.nil?
          present book
        end

        desc 'Creates a new book'
        params do
          requires :title,          type: String
          requires :description,    type: String
          requires :page_count,     type: Integer
        end
        post '/books' do
          Book.create!(book_params(params))
        end
        
        desc 'Updates book'
        params do
          requires :id,             type: Integer
          requires :title,          type: String
          requires :description,    type: String
          requires :page_count,     type: Integer
        end
        put '/books' do
          book = Book.find(params[:id])
          raise NotFoundError if book.nil?
          book.update_attributes!(book_params(params))
        end

        desc 'Deletes book'
        params do
          requires :id, type: Integer
        end
        delete '/books/:id' do
          book = Book.find(params[:id])
          raise NotFoundError if book.nil?
          book.destroy!
        end

    end
end
