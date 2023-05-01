class Occupation < ApplicationRecord
    has_many :users
    has_many :occupation_machines
    has_many :machines, through: :occupation_machines
    has_many :conditions
    
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture1

    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture1_id, numericality: {other_than: 0, message: "can't be blank"}
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }, length: { maximum: 11 }


end
