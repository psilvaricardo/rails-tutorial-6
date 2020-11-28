class ChangeBooksCategoriesJoinsToBooksCategories < ActiveRecord::Migration[6.0]
  def change
    rename_table :books_categories_joins, :books_categories
  end
end
