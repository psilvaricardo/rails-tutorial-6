class Publisher < ApplicationRecord

    # setting up associations
    # https://guides.rubyonrails.org/association_basics.html
    has_one :book

end
