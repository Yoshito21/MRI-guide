class Machine < ApplicationRecord
    has_many :occupation_machines
    has_many :occupations, through: :occupation_machines
    extend ActiveHash::Associations::ActiveRecordExtensions
        belongs_to :manufacturer
        belongs_to :strength

    with_options presence: true do
        validates :manufacturer_id
        validates :strength_id
        validates :name
    end
end
