class Imaging < ApplicationRecord
  has_many :conditions, dependent: :destroy
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :site
  
  with_options presence: true do
    validates :site_id
    validates :purpose
  end
end
