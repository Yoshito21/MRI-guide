# bundle exec rspec spec/models/occupation_spec.rb
require 'rails_helper'

RSpec.describe Occupation, type: :model do
  before do
    @occupation = FactoryBot.build(:occupation)
  end

  describe '施設登録' do
    context '新規登録できるとき' do
      it '必要な情報を適切に入力すれば登録できる' do
        expect(@occupation).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nameが空では登録できない' do
        @occupation.name = ''
        @occupation.valid?
        expect(@occupation.errors.full_messages).to include("Name can't be blank")
      end
      it 'post_codeが半角のハイフンがないと保存できない' do
        @occupation.post_code = '1111111'
        @occupation.valid?
        expect(@occupation.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it 'post_codeが全角を含むと保存できない' do
        @occupation.post_code = '１１１-１１１１'
        @occupation.valid?
        expect(@occupation.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it 'prefecture1_idが空では登録できない' do
        @occupation.prefecture1_id = ''
        @occupation.valid?
        expect(@occupation.errors.full_messages).to include("Prefecture1 can't be blank")
      end
      it 'phone_numberが空では登録できない' do
        @occupation.phone_number = ''
        @occupation.valid?
        expect(@occupation.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが全角数字だと保存できない' do
        @occupation.phone_number = '０００００００００００'
        @occupation.valid?
        expect(@occupation.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberが12桁以上だと保存できない' do
        @occupation.phone_number = '012345678901'
        @occupation.valid?
        expect(@occupation.errors.full_messages).to include('Phone number is too long (maximum is 11 characters)')
      end
      it 'phone_numberが9桁以下だと保存できない' do
        @occupation.phone_number = '012345678'
        @occupation.valid?
        expect(@occupation.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberにハイフンがあると保存できない' do
        @occupation.phone_number = '000-0000-0000'
        @occupation.valid?
        expect(@occupation.errors.full_messages).to include('Phone number is invalid')
      end
      it '重複したphone_numberが存在する場合は登録できない' do
        @occupation.save
        another_occupation = FactoryBot.build(:occupation)
        another_occupation.phone_number = @occupation.phone_number
        another_occupation.valid?
        expect(another_occupation.errors.full_messages).to include('Phone number has already been taken')
      end
    end
  end
end
