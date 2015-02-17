require 'rails_helper'

RSpec.describe "CreatesTasks", type: :request do
  describe "POST tasks" do
    let(:task_params) { { description: 'this is description' } }
    let(:data) { JSON.parse response.body }
    it "creates a new task" do
      post api_v1_tasks_path, { format: :json, task: task_params }
      expect(response).to have_http_status(201)
      expect(data['id']).to be_present
      expect(data['description']).to eq(task_params[:description])
    end
  end
end
