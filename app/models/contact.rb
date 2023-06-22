class Contact < ApplicationRecord
    belongs_to :user
    
    with_options presence: true do
        validates :name
        validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
        validates :message
    end
end
