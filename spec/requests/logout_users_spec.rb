require 'rails_helper'

RSpec.describe "LogoutUser", type: :request do
  describe "DELETE /api/v1/logout" do
    let(:user) { create(:user) } 
    let(:auth_token) { user.auth_token }
    let(:authorization) { ActionController::HttpAuthentication::Token.encode_credentials(auth_token) }

    it "regenerates auth token" do
      delete api_v1_logout_path, { format: :json }, 'HTTP_AUTHORIZATION' => authorization
      expect(response).to have_http_status(204)
      user.reload
      expect(user.auth_token).not_to eq auth_token
    end
  end
end
