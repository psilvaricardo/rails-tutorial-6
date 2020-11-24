class Book < ApplicationRecord

    # setting up associations
    # https://guides.rubyonrails.org/association_basics.html
    has_one :publisher
    # has_one :category

    # Nested attributes allow you to save attributes on associated records through the parent.
    accepts_nested_attributes_for :publisher #, :category

end
