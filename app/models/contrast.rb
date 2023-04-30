class Contrast < ActiveHash::Base
  self.data = [
    { id: 1, name: 'T1' },
    { id: 2, name: 'T2' },
    { id: 3, name: 'DWI' },
    { id: 4, name: 'FLAIR' },
    { id: 5, name: 'SWI' },
    { id: 6, name: 'T2*' },
    { id: 7, name: 'PD' },
    { id: 8, name: 'heavy T2' },
    { id: 9, name: 'CIS' },
    { id: 10, name: 'MRA' },
    { id: 11, name: 'MRV' },
    { id: 12, name: 'Perfusion' },
    { id: 13, name: 'MRS' },
    { id: 14, name: 'MRE' },
    { id: 15, name: 'True FISP' },
    { id: 16, name: 'fMRI' }
  ]

  include ActiveHash::Associations
  has_many :conditions
end
