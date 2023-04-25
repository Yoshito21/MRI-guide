class Condition < ApplicationRecord
    belongs_to :imaging
    belongs_to :user

    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :location
    belongs_to :contrast
    belongs_to :suppression
    belongs_to :enhance

    with_options presence: true do
        validates :location_id
        validates :contrast_id
        validates :suppression_id
        validates :enhance_id
    end
end
