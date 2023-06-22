class Middle < ApplicationRecord
  has_many :imaging_middles
  has_many :imagings, through: :imaging_middles
end
