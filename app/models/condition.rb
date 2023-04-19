class Condition < ApplicationRecord
    has_many :imaging_conditions
    has_many :imagings, through: :imaging_conditions

    with_options presence: true do
        validates :location_id
        validates :contrast_id
        validates :suppression_id
        validates :enhance_id
    end
end
