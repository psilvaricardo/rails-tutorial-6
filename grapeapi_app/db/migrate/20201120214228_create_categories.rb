class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string, :text
      t.string :array
      t.string :true,
      t.string :default
      t.string :[]

      t.timestamps
    end
  end
end
