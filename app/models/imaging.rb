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
    if height_ids.present? || middle_ids.present? || low_ids.present?
      joins(:heights, :middles, :lows)
        .where(imaging_heights: { height_id: height_ids })
        .where(imaging_middles: { middle_id: middle_ids })
        .where(imaging_lows: { low_id: low_ids })
    else
      includes(:heights, :middles, :lows)
    end
  end
end
