class Condition < ApplicationRecord
    has_many :case_conditions
    has_many :cases, through: :case_conditions

    with_options presence: true do
        validates :location_id
        validates :contrast_id
        validates :suppression_id
        validates :enhance_id
    end
end
