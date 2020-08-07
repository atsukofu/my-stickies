require 'rails_helper'
describe Project do
  describe "#create" do
    
    it "nameがないと登録できないこと" do
      project = build(:project, name:nil)
      project.valid?
      expect(project.errors[:name]).to include("can't be blank")
    end

    it "nameがあれば登録できること" do
      project = FactoryBot.create(:project)
      expect(project).to be_valid
    end
    
  end
end