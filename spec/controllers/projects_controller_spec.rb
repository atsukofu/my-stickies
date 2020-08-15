require 'rails_helper'
describe ProjectsController, tipe: :controller do
  describe "GET #index" do
    let(:projects) {create_list(:project, 3)}

      it "200 statusが返ってくること" do
        expect(response).to have_http_status(:ok)
      end
      
  end
end
  