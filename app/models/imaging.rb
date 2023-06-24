class Imaging < ApplicationRecord
  has_many :conditions, dependent: :destroy
  has_many :imaging_heights, dependent: :destroy
  has_many :heights, through: :imaging_heights, dependent: :destroy
  has_many :imaging_middles, dependent: :destroy
  has_many :middles, through: :imaging_middles, dependent: :destroy
  has_many :imaging_lows, dependent: :destroy
  has_many :lows, through: :imaging_lows, dependent: :destroy
  has_one  :remark, dependent: :destroy

  accepts_nested_attributes_for :imaging_heights

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :site
  with_options presence: true do
    validates :site_id
    validates :purpose
  end

  validate :unique_site_id_with_same_purpose

  def unique_site_id_with_same_purpose
    if self.class.where(site_id: site_id, purpose: purpose).where.not(id: id).exists?
      errors.add(:site_id, "can only have one record with the same purpose")
    end
  end


  def self.search_by_heights_lows(height_ids, low_ids)
    if height_ids.present? || low_ids.present?
      joins(:heights, :lows)
        .where(imaging_heights: { height_id: height_ids })
        .where(imaging_lows: { low_id: low_ids })
    else
      includes(:heights, :lows)
    end
  end
end
