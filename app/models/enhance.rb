class Enhance < ActiveHash::Base
  self.data = [
    { id: 0, name: '' },
    { id: 1, name: '単純' },
    { id: 2, name: '造影' },
    { id: 3, name: '造影（dynamic）' }
  ]

  include ActiveHash::Associations
  has_many :conditions
end
