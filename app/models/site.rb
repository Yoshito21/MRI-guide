class Site < ActiveHash::Base
  self.data = [
    { id: 1, name: '頭部' },
    { id: 2, name: '頸部' },
    { id: 3, name: '乳腺' },
    { id: 4, name: '胸部' },
    { id: 5, name: '腹部' },
    { id: 6, name: '骨盤部' },
    { id: 7, name: '脊椎' },
    { id: 8, name: '四肢' },
    { id: 9, name: '血管系' },
    { id: 10, name: 'その他・特殊撮影' }
  ]

  include ActiveHash::Associations
  has_many :imagings
end
