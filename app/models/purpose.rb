class Purpose < ActiveHash::Base
  self.data = [
    { id: 0, name: '' },
    { id: 1, name: '' },
    { id: 2, name: '北海道' },
    { id: 3, name: '青森県' },
    { id: 4, name: '岩手県' },
    { id: 5, name: '宮城県' },
    { id: 6, name: '秋田県' },
    { id: 7, name: '山形県' }
  ]

  include ActiveHash::Associations
  has_many :cases
end
