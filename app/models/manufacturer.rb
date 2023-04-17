class Manufacturer < ActiveHash::Base
  self.data = [
    { id: 1, name: 'siemens' },
    { id: 2, name: 'philips' },
    { id: 3, name: 'GE' },
    { id: 4, name: 'Canon' },
    { id: 5, name: 'FUJI FILM' }
  ]

  include ActiveHash::Associations
  has_many :users
end
