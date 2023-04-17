class Location < ActiveHash::Base
  self.data = [
    { id: 1, name: 'tra' },
    { id: 2, name: 'cor' },
    { id: 3, name: 'sag' },
    { id: 4, name: 'obl-tra' },
    { id: 5, name: 'obl-cor' },
    { id: 6, name: 'obl-sag' },
    { id: 7, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :conditions
end
