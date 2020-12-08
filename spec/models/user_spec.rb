require 'rails_helper'

RSpec.describe User, type: :model do
  describe "ユーザー登録のテスト" do
    # 正常系
    it "すべての項目が入力されていたら登録ができる" do

    end

    it "prefecture_idが空欄でも登録できる" do

    end

    it "worksが空欄でも登録できる" do

    end

    it "likes_authorが空欄でも登録できる" do

    end

    it "likes_bookが空欄でも登録できる" do
      
    end

    # 異常系
    it "nicknameが空欄だと登録ができない" do

    end

    it "emailが空欄だと登録ができない" do

    end

    it "emailに@が含まれていなければ登録ができない" do

    end

    it "emailに一意性がなければ登録できない" do

    end

    it "passwordが空欄だと登録ができない" do

    end

    it "passwordに全角文字が含まれていた場合登録できない" do

    end

    it "passwordが半角英字のみだと登録できない" do

    end

    it "passwordが半角数字のみだと登録できない" do
      
    end

    it "passwordが6文字未満の場合登録できない" do

    end

    it "password_confirmationが空欄だと登録ができない" do

    end

    it "passwordとpassword_confirmationが一致していないと登録ができない" do

    end

  end
end
