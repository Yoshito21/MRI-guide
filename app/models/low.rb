class Low < ApplicationRecord
  has_many :imaging_lows
  has_many :imagings, through: :imaging_lows
end
