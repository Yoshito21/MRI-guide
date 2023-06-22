class Remark < ApplicationRecord
    belongs_to :imaging
    belongs_to :occupation

    validates :content, presence: true
end
