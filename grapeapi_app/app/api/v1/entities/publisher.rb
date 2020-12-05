module V1
    module Entities
        class Publisher < Grape::Entity
            expose :id
            expose :name
        end
    end
end