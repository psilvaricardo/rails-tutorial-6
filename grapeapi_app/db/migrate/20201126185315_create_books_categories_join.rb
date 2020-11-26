class CreateBooksCategoriesJoin < ActiveRecord::Migration[6.0]
  def change
    create_table :books_categories_joins, :id => false do |t|
      t.integer :books_id
      t.integer :categories_id
    end
  end
end
