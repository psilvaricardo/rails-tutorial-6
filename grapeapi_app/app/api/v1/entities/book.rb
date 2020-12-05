module V1
    module Entities
        class Book < Grape::Entity
            expose :id
            expose :title
            expose :description
            expose :page_count
            expose :publisher_id
            expose :created_at
            expose :updated_at
            expose :publisher, with: V1::Entities::Publisher
            expose :categories, with: V1::Entities::Category
        end
    end
end
