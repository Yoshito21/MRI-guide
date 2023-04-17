class Case < ApplicationRecord
    
    belongs_to :user
    has_many :case_conditions, dependent: :destroy
    has_many :conditions, through: :case_conditions
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :site
    
    with_options presence: true do
      validates :site_id
      validates :purpose
    end
  end
  