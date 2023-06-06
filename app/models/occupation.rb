class Occupation < ApplicationRecord
    has_many :users, dependent: :nullify
    has_many :occupation_machines, dependent: :destroy
    has_many :machines, through: :occupation_machines, dependent: :destroy
    has_many :conditions, dependent: :destroy
    has_many :occupation_memberships, dependent: :destroy
    
  before_destroy :destroy_if_no_users

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture1

    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture1_id, numericality: {other_than: 0, message: "can't be blank"}
    validates_uniqueness_of :phone_number, format: { with: /\A\d{10,11}\z/ }, length: { maximum: 11 }


  def self.search_by_name(name)
    where('name LIKE ?', "%#{name}%")
  end
  
  private

  def destroy_if_no_users
    destroy if users.count.zero?
  end
end
