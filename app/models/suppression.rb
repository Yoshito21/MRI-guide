class Suppression < ActiveHash::Base
    self.data = [
      { id: 1, name: 'none' },
      { id: 2, name: 'FS' },
      { id: 3, name: 'SPAIR' },
      { id: 4, name: 'Fluid suppression' },
      { id: 5, name: 'FLASH' }
    ]
  
    include ActiveHash::Associations
    has_many :conditions
  end
  