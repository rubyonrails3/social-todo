require 'rails_helper'

RSpec.describe "SignsUpUsers", type: :request do
  describe "POST /api/v1/sign_up" do
    let(:user) { build(:user) } 
    let(:user_params) { 
      user.attributes.slice('first_name', 'last_name', 'email').merge({
        password: user.password, password_confirmation: user.password
      })
    }
    let(:data) { JSON.parse response.body }


    it "creates new user" do
      post api_v1_sign_up_path, { format: :json, user: user_params }
      expect(response).to have_http_status(201)
      expect(data['id']).to be_present
      expect(data['first_name']).to eq(user.first_name)
      expect(data['last_name']).to eq(user.last_name)
      expect(data['email']).to eq(user.email)
      expect(data['auth_token']).to be_present
    end
  end
end
