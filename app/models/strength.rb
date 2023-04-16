class Strength < ActiveHash::Base
  self.data = [
    { id: 0, name: '' },
    { id: 1, name: '3T' },
    { id: 2, name: '1.5T' },
    { id: 3, name: '0.55T' },
    { id: 4, name: '0.4T' },
    { id: 5, name: '0.3T' },
    { id: 6, name: '0.25T' }
  ]

  include ActiveHash::Associations
  has_many :users
end
