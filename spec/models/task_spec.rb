require 'rails_helper'
describe Task do
  describe '#create' do
    it "titleがないと登録できないこと" do
      task = build_stubbed(:task, title: nil)
      task.valid?
      expect(task.errors[:title]).to include("can't be blank")
    end

    it "titleが31文字以上だと登録できないこと" do
      task = build_stubbed(:task, title: "abcdefghijklmnopqrstuvwxyzabcde")
      task.valid?
      expect(task.errors[:title]).to include("is too long (maximum is 30 characters)")
    end

    it "titleが30文字以内だと登録できること" do
      task = build_stubbed(:task, title: "abcdefghijklmnopqrstuvwxyzabcd")
      expect(task).to be_valid
    end

    it "statusがないと登録できないこと" do
      task = build_stubbed(:task, status: nil)
      task.valid?
      expect(task.errors[:status]).to include("can't be blank")
    end

    it "project_idがないと登録できないこと" do
      task = build_stubbed(:task, project_id: nil)
      task.valid?
      expect(task.errors[:project]).to include("must exist")
      expect(task.errors[:project_id]).to include("can't be blank")
    end

    it "contentがなくてもtitle,status,project_idがあれば登録できること" do
      expect(build_stubbed(:task, content: nil)).to be_valid
    end
  end
end
