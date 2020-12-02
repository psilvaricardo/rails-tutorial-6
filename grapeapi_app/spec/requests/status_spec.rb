require 'rails_helper'

RSpec.describe "Response status" do

    describe "GET /api/v1/books" do
        it 'books returns a response status code' do
            get('/api/v1/books')
            expect(response.status).to eq(200)
        end
    end


    # CHECK LATER
    # https://medium.com/@sedwardscode/how-to-properly-test-a-rails-api-with-rspec-f15cbe1dfd11

    # describe "GET /api/v1/books/:id" do
    #     let!(:book){ create(:book) }
    #     it 'returns 200 status for a valid id' do
    #         get('/api/v1/books/1')
    #         expect(response.status).to eq(200)
    #     end
    # end

    # describe "GET /api/v1/books/:id" do
    #     let!(:book ){ Book.new }
    #     it 'returns 404 status for an invalid id' do
    #         get('/api/v1/books/5000')
    #         expect(response.status).to raise_error(ActiveRecord::RecordNotFound)
            
    #     end
    # end

    describe "GET /api/v1/categories" do
        it 'categories returns a response status code' do
            get('/api/v1/categories')
            expect(response.status).to eq(200)
        end
    end

    describe "GET /api/v1/publishers" do
        it 'categories returns a response status code' do
            get('/api/v1/publishers')
            expect(response.status).to eq(200)
        end
    end

end
