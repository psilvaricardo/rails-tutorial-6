class Publisher < ApplicationRecord
    # setting up associations
    # https://guides.rubyonrails.org/association_basics.html
    belongs_to :book 
end
