# bundle exec rspec spec/models/contact_spec.rb
require 'rails_helper'

RSpec.describe Contact, type: :model do
  before do
    user = FactoryBot.build(:user)
    @contact = FactoryBot.build(:contact, user: user)
  end

  describe '問い合わせ新規投稿' do
    context '新規投稿できるとき' do
      it '必要な情報を適切に入力すれば投稿できる' do
        expect(@contact).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @contact.name = ''
        @contact.valid?
        expect(@contact.errors.full_messages).to include("Name can't be blank")
      end
      it 'emailが空では登録できない' do
        @contact.email = ''
        @contact.valid?
        expect(@contact.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailは@を含まないと登録できない' do
        @contact.email = 'testmail'
        @contact.valid?
        expect(@contact.errors.full_messages).to include('Email is invalid')
      end
      it 'emailに全角文字があると登録できない' do
        @contact.email = 'Ａa@gmail.com'
        @contact.valid?
        expect(@contact.errors.full_messages).to include('Email is invalid')
      end
      it 'messageが空では登録できない' do
        @contact.message = ''
        @contact.valid?
        expect(@contact.errors.full_messages).to include("Message can't be blank")
      end
    end
  end
end
