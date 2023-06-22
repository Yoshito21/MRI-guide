# bundle exec rspec spec/models/condition_spec.rb
require 'rails_helper'

RSpec.describe Condition, type: :model do
  before do
    occupation = FactoryBot.build(:occupation)
    imaging = FactoryBot.build(:imaging)
    @condition = FactoryBot.build(:condition, occupation: occupation, imaging: imaging)
  end

  describe '撮影条件登録' do
    context '新規登録できるとき' do
      it '必要な情報を適切に入力すれば登録できる' do
        expect(@condition).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'location_idが空では登録できない' do
        @condition.location_id = ''
        @condition.valid?
        expect(@condition.errors.full_messages).to include("Location can't be blank")
      end
      it 'contrast_idが空では登録できない' do
        @condition.contrast_id = ''
        @condition.valid?
        expect(@condition.errors.full_messages).to include("Contrast can't be blank")
      end
      it 'suppression_idが空では登録できない' do
        @condition.suppression_id = ''
        @condition.valid?
        expect(@condition.errors.full_messages).to include("Suppression can't be blank")
      end
      it 'enhance_idが空では登録できない' do
        @condition.enhance_id = ''
        @condition.valid?
        expect(@condition.errors.full_messages).to include("Enhance can't be blank")
      end
    end
  end
end
