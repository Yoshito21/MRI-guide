# bundle exec rspec spec/models/imaging_spec.rb
require 'rails_helper'

RSpec.describe Imaging, type: :model do
  before do
    @imaging = FactoryBot.build(:imaging)
  end

  describe '検査項目登録' do
    context '新規登録できるとき' do
      it '必要な情報を適切に入力すれば登録できる' do
        expect(@imaging).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'site_idが空では登録できない' do
        @imaging.site_id = ''
        @imaging.valid?
        expect(@imaging.errors.full_messages).to include("Site can't be blank")
      end
      it 'purposeが空では登録できない' do
        @imaging.purpose = ''
        @imaging.valid?
        expect(@imaging.errors.full_messages).to include("Purpose can't be blank")
      end
      it '同じ組み合わせのsite_idとpurposeが存在する場合は登録できない' do
        @imaging.save
        another_imaging = FactoryBot.build(:imaging)
        another_imaging.site_id = @imaging.site_id
        another_imaging.purpose = @imaging.purpose
        another_imaging.valid?
        expect(another_imaging.errors.full_messages).to include('Site has already been taken with the same purpose')
      end
    end
  end
end
