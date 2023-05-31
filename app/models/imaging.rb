class Imaging < ApplicationRecord
  has_many :conditions, dependent: :destroy
  has_many :imaging_heights, dependent: :destroy
  has_many :heights, through: :imaging_heights, dependent: :destroy
  has_many :imaging_middles, dependent: :destroy
  has_many :middles, through: :imaging_middles, dependent: :destroy
  has_many :imaging_lows, dependent: :destroy
  has_many :lows, through: :imaging_lows, dependent: :destroy

  accepts_nested_attributes_for :imaging_heights

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :site
  with_options presence: true do
    validates :site_id
    validates :purpose
  end
  
  def self.search_by_heights_middles_lows(height_ids, middle_ids, low_ids)
    includes(:heights, :middles, :lows)
      .where(heights: { id: height_ids })
      .where(middles: { id: middle_ids })
      .where(lows: { id: low_ids })
  end
end
