require 'rails_helper'

RSpec.describe 'UpdatesUser' do
    let(:user) { create(:user) }
    let(:authorized) { ActionController::HttpAuthentication::Token.encode_credentials(user.auth_token) }
    let(:user_params) { { first_name: 'Rails', last_name: 'Ruby' } }


  describe 'When not logged in' do
    it 'is not allowed to update' do
      patch api_v1_user_path, { format: :json, user: user_params }
      expect(response).to have_http_status(401)
    end
  end


  describe 'When logged in' do
    it 'updates the current user' do
      patch api_v1_user_path, { format: :json, user: user_params }, 'HTTP_AUTHORIZATION' => authorized
      expect(response).to have_http_status(204)
      user.reload
      expect(user.first_name).to eq user_params[:first_name]
      expect(user.last_name).to eq user_params[:last_name]
    end
  end
end
