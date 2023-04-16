class Case < ApplicationRecord
    
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :site
  
  with_options presence: true do
    validates :site_id
    validates :purpose
    validates :user_id
  end
end
