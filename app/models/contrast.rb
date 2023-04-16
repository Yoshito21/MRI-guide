class Contrast < ActiveHash::Base
  self.data = [
    { id: 0, name: '' },
    { id: 1, name: 'T1' },
    { id: 2, name: 'T2' },
    { id: 3, name: 'DWI' },
    { id: 4, name: 'FLAIR' },
    { id: 5, name: 'SWI' },
    { id: 6, name: 'T2*' },
    { id: 7, name: 'PD' },
    { id: 8, name: 'CIS' },
    { id: 9, name: 'MRA' },
    { id: 10, name: 'MRV' },
    { id: 11, name: 'Perfusion' },
    { id: 12, name: 'MRS' },
    { id: 13, name: 'MRE' },
    { id: 14, name: 'True FISP' },
    { id: 15, name: 'fMRI' }
  ]

  include ActiveHash::Associations
  has_many :conditions
end
