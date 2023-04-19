class ImagingCondition < ApplicationRecord
    belongs_to :imaging
    belongs_to :condition
end
