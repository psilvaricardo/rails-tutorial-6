class FixBooksId < ActiveRecord::Migration[6.0]
  def change
    rename_column :books_categories, :books_id, :book_id
  end
end
