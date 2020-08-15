require 'rails_helper'
describe Project do
  context "userを保存できない場合" do   
    it "usernameがないと登録できないこと" do
      user = build(:user, username:nil)
      user.valid?
      expect(user.errors[:username]).to include("can't be blank")
    end
  
    it "usernameが16文字以上だと登録できないこと" do
      user = build(:user, username: "abcdefghijklmnop")
      user.valid?
      expect(user.errors[:username]).to include("is too long (maximum is 15 characters)")
    end
  
    it "emailが他ユーザーと重複していると登録できないこと" do
      user = create(:user, email: "ababab@email.com")
      another_user = build(:user, email: "ababab@email.com")
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end
  
    it "emailがないと登録できないこと" do
      user = build(:user, email:nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank", "is invalid")
    end
  
    it "emailに「-_.」以外の記号があると登録できないこと" do
      user = build(:user, email:"aaa:@aaa.com")
      user.valid?
      expect(user.errors[:email]).to include("is invalid")
    end
  
    
    it "passwordがないと登録できないこと" do
      user = build(:user, password:nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end
    
    it "passwordが8文字以下であれば登録できないこと" do
      user = build(:user, password: "abcdefg")
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 8 characters)")
    end
    
    it "passwordとpassword_confirmationが異なると登録できないこと" do
      user = build(:user, password_confirmation: "00000001")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end
  end
  
  context "userを保存できる場合" do
    it "usernameが15文字以内であれば登録できること" do
      expect(build(:user, username: "abcdefghijklmno")).to be_valid
    end
    
    it "passwordが8文字以上であれば登録できること" do
      expect(build(:user, password: "00000000", password_confirmation: "00000000")).to be_valid
    end
    
    it "username, email, passwordが存在すれば登録できること" do
      expect(build(:user)).to be_valid
    end
    
    it "emailに「-_.」の記号が入っていても登録できること" do
      expect(build(:user, email: "a-a_a.a@aaa.com")).to be_valid
    end
  end
end