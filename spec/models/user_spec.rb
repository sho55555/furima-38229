require 'rails_helper'

RSpec.describe User, type: :model do
  describe "ユーザー新規登録" do
    it "ニックネームが空だと登録できない" do
    end

    it "メールアドレスが空だと登録できない" do
    end

    it "既に登録されているメールアドレスは登録できない" do
    end

    it "@を含まないメールアドレスは登録できない" do
    end

    it "passwordが空だと登録できない" do
    end

    it "passwordが6文字以上でないと登録できない" do
    end

    it "passwordが半角英数字混合でないと登録できない" do
    end

    it "passwordと確認用passwordが一致していないと登録できない" do
    end

    it "名字が空だと登録できない" do
    end

    it "名前が空だと登録できない" do
    end

    it "名字(カナ)が空だと登録できない" do
    end

    it "名前(カナ)が空だと登録できない" do
    end

    it "生年月日が空だと登録できない" do
    end
  end
end
