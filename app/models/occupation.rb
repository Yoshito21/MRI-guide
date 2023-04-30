class Occupation < ApplicationRecord
    has_many :users
    has_many :occupation_machines
    has_many :machines, through: :occupation_machines
    has_many :conditions

    with_options presence: true do
        validates :name
        validates :post_code
        validates :prefecture_id
        validates :phone_number
      end
    

end
