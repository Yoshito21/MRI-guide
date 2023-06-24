class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

  belongs_to :occupation, optional: true
  has_many :occupation_memberships, dependent: :destroy
  has_many :contacts, dependent: :destroy

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze }
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture2
  
  with_options presence: true do
    validates :nickname
    validates :prefecture2_id

  end
end
