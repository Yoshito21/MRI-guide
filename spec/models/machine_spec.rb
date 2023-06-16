# bundle exec rspec spec/models/machine_spec.rb
require 'rails_helper'

RSpec.describe Machine, type: :model do
  before do
    @machine = FactoryBot.build(:machine, occupation_id: 1)
  end

  describe '使用機器登録' do
    context '新規登録できるとき' do
      it '必要な情報を適切に入力すれば登録できる' do
        expect(@machine).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'manufacturer_idが空では登録できない' do
        @machine.manufacturer_id = ''
        @machine.valid?
        expect(@machine.errors.full_messages).to include("Manufacturer can't be blank")
      end
      it 'strength_idが空では登録できない' do
        @machine.strength_id = ''
        @machine.valid?
        expect(@machine.errors.full_messages).to include("Strength can't be blank")
      end
      it 'nameが空では登録できない' do
        @machine.name = ''
        @machine.valid?
        expect(@machine.errors.full_messages).to include("Name can't be blank")
      end
    end
  end
end
