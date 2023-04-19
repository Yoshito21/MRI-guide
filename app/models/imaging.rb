class Imaging < ApplicationRecord
  belongs_to :user
  has_many :imaging_conditions, dependent: :destroy
  has_many :conditions, through: :imaging_conditions
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :site
  
  with_options presence: true do
    validates :site_id
    validates :purpose
  end
end
