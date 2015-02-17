require 'rails_helper'

RSpec.describe CreatesTask do
  subject { CreatesTask.new(services) }
  let(:tasks) { double 'ActiveRecord Task' }
  let(:user) { double 'User', id: 1 }
  let(:services) {
    { 'Tasks' => tasks }
  }
  let(:task) {  double 'Task', id: 1 }
  let(:task_params) { { description: 'this is desc' } }

  it 'creates a new task' do
    expect(tasks).to receive(:create).with(task_params) { task }
    subject.create current_user: user, params: task_params
  end
end
