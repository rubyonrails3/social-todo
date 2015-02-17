require 'rails_helper'

RSpec.describe "CreatesTasks", type: :request do
  describe "POST tasks" do
    let(:task_params) { { description: 'this is description' } }
    let(:data) { JSON.parse response.body }
    let(:user) { create(:user) }
    let(:authorization) { ActionController::HttpAuthentication::Token.encode_credentials(user.auth_token) }


    describe 'When not logged in' do

      it 'is not allowed to create task' do
        post api_v1_tasks_path, { format: :json, task: task_params }
        expect(response).to have_http_status(401)
      end
    end


    describe 'When logged in' do

      it "creates a new task" do
        post api_v1_tasks_path, { format: :json, task: task_params }, 'HTTP_AUTHORIZATION' => authorization
        expect(response).to have_http_status(201)
        expect(data['id']).to be_present
        expect(data['user_id']).to eq user.id
        expect(data['description']).to eq(task_params[:description])
        expect(data['done']).to be_falsey
      end
    end

  end
end
