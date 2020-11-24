class AddPublisherRefToBook < ActiveRecord::Migration[6.0]
  # This will create a publisher_id column and appropriate index
  # https://edgeguides.rubyonrails.org/active_record_migrations.html
  def change
    add_reference :books, :publisher, null: true, foreign_key: true
  end
end
