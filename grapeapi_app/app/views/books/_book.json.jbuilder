json.extract! book, :id, :title, :description, :page_count, :created_at, :updated_at
json.url book_url(book, format: :json)
