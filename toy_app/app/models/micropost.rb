class Micropost < ApplicationRecord

    # adding new associations
    belongs_to :user

    # adding new validations to the model
    validates :content, length: {maximum: 140}
    
end
