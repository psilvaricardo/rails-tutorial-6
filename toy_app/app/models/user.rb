class User < ApplicationRecord

    # adding new associations
    has_many :microposts
    
end
