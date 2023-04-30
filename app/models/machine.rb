class Machine < ApplicationRecord
    has_many :occupation_machines
    has_many :occupations, through: :occupation_machines
end
