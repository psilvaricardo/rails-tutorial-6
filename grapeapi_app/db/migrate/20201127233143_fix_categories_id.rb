class FixCategoriesId < ActiveRecord::Migration[6.0]
  def change
    rename_column :books_categories, :categories_id, :category_id
  end
end
