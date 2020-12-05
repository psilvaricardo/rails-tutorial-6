require 'rails_helper'
require 'factory_bot_rails' 

RSpec.describe "Response status" do

    describe "GET /api/v1/books" do
        it 'should return a valid http response' do
            get('/api/v1/books')
            # puts response.body
            expect(response.status).to eq(200)
        end
    end

    # https://medium.com/@sedwardscode/how-to-properly-test-a-rails-api-with-rspec-f15cbe1dfd11
    describe "GET /api/v1/books/:id" do
        it 'should return a valid http response from given ID' do
            FactoryBot.create(:book, 
                id:             1,
                title:          Faker::Book.title,
                description:    Faker::Lorem.paragraph,
                page_count:     Faker::Number.between(from: 100, to: 5000),
                publisher_id:   FactoryBot.create(:publisher, name: "MCGraw Hill").id,
                categories:     
                    [
                        FactoryBot.create(:category, name: "fakeCat1"), 
                        FactoryBot.create(:category, name: "FakeCat2")
                    ]
                )

            get('/api/v1/books/1')
            # puts response.body

            expect(response.status).to eq(200)
            expect(response.body).not_to be_empty
        end
    end    

    describe "POST /api/v1/books/" do
        it 'should create a new book' do
            post '/api/v1/books/', params:
            {
                "book": {
                    "title": "The Theory of Everything",
                    "description": "Hawking gave us a new look at our world, our universe, and ourselves.",
                    "page_count": 119
                },
                "publisher": {
                    "name": "New Millennium Press"
                },
                "categories": ["Science ", "Astrophysics"]
            }
            
            expect(response.status).to eq(201)
        end
    end

    describe "PUT /books/:id" do
        it 'should update an existing book' do
            # let's create a random book.
            post '/api/v1/books/', params:
            {
                "book": {
                    "title": "The Theory of Everything",
                    "description": "Hawking gave us a new look at our world, our universe, and ourselves.",
                    "page_count": 119
                },
                "publisher": {
                    "name": "New Millennium Press"
                },
                "categories": ["Science ", "Astrophysics"]
            }
            
            # let's update the same book.
            put  '/api/v1/books/1', params:
            {
                "book": {
                    "title": "The Theory of Nothing",
                    "description": "Hawking gave us a new look at our world, our universe, and ourselves.",
                    "page_count": 119
                },
                "publisher": {
                    "name": "New Millennium Press"
                },
                "categories": ["Science ", "Astrophysics"]
            }

            parsed_response = JSON.parse(response.body)
            expect(parsed_response['title']).to eq('The Theory of Nothing') 
            # puts parsed_response 
        end
    end

    describe "delete '/books/:id" do
        it 'should delete the book from the given ID' do
            FactoryBot.create(:book, 
                id:             1,
                title:          Faker::Book.title,
                description:    Faker::Lorem.paragraph,
                page_count:     Faker::Number.between(from: 100, to: 5000),
                publisher_id:   FactoryBot.create(:publisher, name: "MCGraw Hill").id,
                categories:     
                    [
                        FactoryBot.create(:category, name: "fakeCat1"), 
                        FactoryBot.create(:category, name: "FakeCat2")
                    ]
                )
            delete('/api/v1/books/1')
            expect(response.status).to eq(200)
        end
    end

    describe "GET /api/v1/categories" do
        it 'should return a valid http response for cateories' do
            get('/api/v1/categories')
            expect(response.status).to eq(200)
        end
    end

    describe "GET /api/v1/publishers" do
        it 'should return a valid http response for publishers' do
            get('/api/v1/publishers')
            expect(response.status).to eq(200)
        end
    end

end
