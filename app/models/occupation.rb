class Occupation < ApplicationRecord
    has_many :users, dependent: :nullify
    has_many :occupation_machines, dependent: :destroy
    has_many :machines, through: :occupation_machines, dependent: :destroy
    has_many :conditions, dependent: :destroy
    has_many :occupation_memberships, dependent: :destroy
    has_one  :remark, dependent: :destroy
    
  before_destroy :destroy_if_no_users

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture1

    with_options presence: true do
      validates :name
      validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
      validates :prefecture1_id, numericality: {other_than: 0, message: "can't be blank"}
      validates :phone_number, uniqueness: true, format: { with: /\A\d{10,11}\z/, message: 'is invalid' }, length: { maximum: 11 }
    end

  def self.search_by_name(name)
    where('name LIKE ?', "%#{name}%")
  end
  
  private

  def destroy_if_no_users
    destroy if users.count.zero?
  end
end
