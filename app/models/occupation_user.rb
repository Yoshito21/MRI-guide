class OccupationUser

    include ActiveModel::Model
    attr_accessor :name, :post_code, :prefecture1_id, :municipality, :address, :building_name, :phone_number,
                  :nickname, :prefecture2_id, :email, :password, :password_confirmation, :occupation_id

    # ここにバリデーションの処理を書く
    with_options presence: true do
      validates :occupation_id
      validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
      validates :municipality
      validates :address
      validates :phone_number, format: { with: /\A\d{10,11}\z/ }, length: { maximum: 11 }
      validates :nickname
      validates :prefecture1_id, numericality: {other_than: 0, message: "can't be blank"}
      validates :prefecture2_id, numericality: {other_than: 0, message: "can't be blank"}
      #VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
      validates :email #, format: { with: VALID_EMAIL_REGEX }
      VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
      validates :password, format: { with: VALID_PASSWORD_REGEX }
    end

  
    def save
      occupation = Occupation.create(name: name, prefecture1_id: prefecture1_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number)
      User.create(nickname: nickname, prefecture2_id: prefecture2_id, email: email, password: password, occupation_id: occupation_id)
    end
  end