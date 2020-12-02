require 'rails_helper'

RSpec.describe "Model keys" do

    describe "GET /api/v1/books" do
        it 'book keys' do
            get('/api/v1/books')
            parsed_response = JSON.parse(response.body)
            parsed_response.each do |book|
                expect(book.keys).to contain( :title, :description, :page_count, :publisher_id )
            end
        end
    end

    describe "GET /api/v1/categories" do
        it 'category keys' do
            get('/api/v1/categories')
            parsed_response = JSON.parse(response.body)
            parsed_response.each do |category|
                expect(category.keys).to contain( :id, :name )
            end
        end
    end

    describe "GET /api/v1/publishers" do
        it 'publisher keys' do
            get('/api/v1/publishers')
            parsed_response = JSON.parse(response.body)
            parsed_response.each do |publisher|
                expect(publisher.keys).to contain( :id, :name )
            end
        end
    end

end
