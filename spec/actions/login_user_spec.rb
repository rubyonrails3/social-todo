require 'rails_helper'

RSpec.describe LoginUser do
  subject { LoginUser.new(services) }
  let(:users) { double 'ActiveRecord User' }
  let(:services) { 
    { 'Users' => users }
  }
  let(:user) { double 'User' }
  let(:user_params) { { email: 'user@exmaple.com', password: 'password' } }

  it 'finds user' do
    expect(users).to receive(:find_by!).with(email: user_params[:email]) { user }
    expect(user).to receive(:authenticate).with(user_params[:password]) { user }
    subject.login params: user_params
  end
end
