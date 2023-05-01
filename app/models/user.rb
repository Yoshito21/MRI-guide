class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

  belongs_to :occupation, optional: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture2
  
  with_options presence: true do
    validates :nickname
    validates :prefecture2_id, numericality: {other_than: 0, message: "can't be blank"}

  end

end
