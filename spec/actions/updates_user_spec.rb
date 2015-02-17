require 'rails_helper'

RSpec.describe UpdatesUser do
  subject { UpdatesUser.new(services) }
  let(:users) { double 'ActiveRecord User' }
  let(:services) {
    { 'Users' => users }
  }
  let(:user) { double('User') } 
  let(:user_params) { { first_name: 'first_name' } }

  it 'updates user info'  do
    expect(user).to receive(:update!).with(user_params) { true }
    subject.update current_user: user, params: user_params
  end
end
