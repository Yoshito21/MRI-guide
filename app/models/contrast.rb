class Contrast < ActiveHash::Base
  self.data = [
    { id: 1, name: 'T1' },
    { id: 2, name: 'T2' },
    { id: 3, name: 'DWI' },
    { id: 4, name: 'FLAIR' },
    { id: 5, name: 'STIR' },
    { id: 6, name: 'T2*' },
    { id: 7, name: 'PD' },
    { id: 8, name: 'heavy T2' },
    { id: 9, name: 'SWI' },
    { id: 10, name: 'CIS' },
    { id: 11, name: 'MRA' },
    { id: 12, name: 'MRV' },
    { id: 13, name: 'Perfusion' },
    { id: 14, name: 'MRS' },
    { id: 15, name: 'MRE' },
    { id: 16, name: 'True FISP' },
    { id: 17, name: 'fMRI' }
  ]

  include ActiveHash::Associations
  has_many :conditions
end
