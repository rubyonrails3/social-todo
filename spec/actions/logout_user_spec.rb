require 'rails_helper'

RSpec.describe LogoutUser do
  subject { LogoutUser.new(services) }
  let(:users) { double 'ActiveRecord User' }
  let(:services) {
    { 'Users' => users }
  }
  let(:user) { double 'User' }

  it 'regenrates the auth token which invalidates the current token login session' do
    expect(user).to receive(:regenerate_auth_token)
    subject.logout current_user: user
  end
end
