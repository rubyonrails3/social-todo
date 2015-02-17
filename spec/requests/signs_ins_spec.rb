require 'rails_helper'

RSpec.describe "SignsIns", type: :request do
  describe "POST /sign_in" do
    let(:user) { create(:user)  }
    let(:data) { JSON.parse response.body }
    it "signs user in and returns auth_token" do
      post api_v1_login_path, { format: :json, email: user.email, password: user.password }
      expect(response).to have_http_status(200)
      expect(data['id']).to eq user.id
      expect(data['first_name']).to eq user.first_name
      expect(data['last_name']).to eq user.last_name
      expect(data['email']).to eq user.email
      expect(data['auth_token']).to eq user.auth_token
    end
  end
end
