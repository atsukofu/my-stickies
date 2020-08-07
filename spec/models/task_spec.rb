require 'rails_helper'

describe Task do
  describe '#create' do
    it "titleがない場合は登録できないこと" do
      task = build(:task, title: nil)
      task.valid?
      expect(task.errors[:title]).to include("can't be blank")
    end

    it "statusがない場合は登録できないこと" do
      task = build(:task, status: nil)
      task.valid?
      expect(task.errors[:status]).to include("can't be blank")
    end

    it "project_idがない場合は登録できないこと" do
      task = build(:task, project_id: nil)
      task.valid?
      expect(task.errors[:project_id]).to include("can't be blank")
    end

    it "title,statusがある場合は登録できること" do
      project = FactoryBot.create(:project)
      task = build(:task, project_id:1)
      expect(task).to be_valid
    end
    
  end
end