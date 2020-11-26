class Book < ApplicationRecord

    # setting up associations
    # https://guides.rubyonrails.org/association_basics.html
    # https://github.com/rails/rails/issues/34454 
    belongs_to :publisher, optional: true
    has_and_belongs_to_many :categories

end
