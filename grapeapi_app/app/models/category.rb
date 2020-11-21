class Category < ApplicationRecord

    # This fix is specific for DBs like SQLite not PostgreSQL nor MySQL.
    serialize :category, Array

    # setting up associations
    # https://guides.rubyonrails.org/association_basics.html
    belongs_to :book
end
