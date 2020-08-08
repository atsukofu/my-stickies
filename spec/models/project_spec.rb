require 'rails_helper'
describe Project do
  describe '#create' do
    it "nameがないと登録できないこと" do
      project = build(:project, name: nil)
      project.valid?
      expect(project.errors[:name]).to include("can't be blank")
    end

    it "nameが31文字以上だと登録できないこと" do
      project = build(:project, name: "abcdefghijklmnopqrstuvwxyzabcde")
      project.valid?
      expect(project.errors[:name]).to include("is too long (maximum is 30 characters)")
    end

    it "user_idがないと登録できないこと" do
      project = build(:project, user_id: nil)
      project.valid?
      expect(project.errors[:user]).to include("must exist")
    end

    it "name,user_id があれば登録できること" do
      expect(build(:project)).to be_valid 
    end
    
    it "nameが30文字以内であれば登録できること" do
      expect(build(:project, name: "abcdefghijklmnopqrstuvwxyzabcd")).to be_valid 
    end
  
  end

end