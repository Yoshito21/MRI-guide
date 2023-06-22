# bundle exec rspec spec/models/remark_spec.rb
require 'rails_helper'

RSpec.describe Remark, type: :model do
  before do
    occupation = FactoryBot.build(:occupation)
    imaging = FactoryBot.build(:imaging)
    @remark = FactoryBot.build(:remark, occupation: occupation, imaging: imaging)
  end

  describe '撮影条件登録' do
    context '新規登録できるとき' do
      it '必要な情報を適切に入力すれば登録できる' do
        expect(@remark).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'contentが空では登録できない' do
        @remark.content = ''
        @remark.valid?
        expect(@remark.errors.full_messages).to include("Content can't be blank")
      end
    end
  end
end
