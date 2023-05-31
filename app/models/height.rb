class Height < ApplicationRecord
  has_many :imaging_heights
  has_many :imagings, through: :imaging_heights
end
