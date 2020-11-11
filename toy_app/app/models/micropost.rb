class Micropost < ApplicationRecord

    # adding new validations to the model
    validates :content, length: {maximum: 140}
    
end
