class Imaging < ApplicationRecord
  has_many :user_imagings
  has_many :users, through: :user_imagings
  has_many :conditions, dependent: :destroy
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :site
  
  with_options presence: true do
    validates :site_id
    validates :purpose
  end
end
