class Book < ApplicationRecord
    # setting up associations
    # https://guides.rubyonrails.org/association_basics.html
    has_one :publisher
    has_one :category
end
