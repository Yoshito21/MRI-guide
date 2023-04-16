class Suppression < ActiveHash::Base
    self.data = [
      { id: 0, name: '' },
      { id: 1, name: 'Fat suppression' },
      { id: 2, name: 'SPAIR' },
      { id: 3, name: 'Fluid suppression' },
      { id: 4, name: 'FLASH' }
    ]
  
    include ActiveHash::Associations
    has_many :conditions
  end
  