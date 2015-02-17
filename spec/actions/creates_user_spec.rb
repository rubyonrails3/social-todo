require 'rails_helper'

RSpec.describe CreatesUser do
  subject { CreatesUser.new(services)  }
  let(:users) { double 'ActiveRecord User' }
  let(:services) { 
    { 'Users' => users }
  }
  let(:user) { double 'User', id: 1 }
  let(:user_params) { 
    { 
      first_name: 'ismail', last_name: 'akram', email: 'rubyonrails3@gmail.com',
      password: 'password', password_confirmation: 'password'
    }
  }
  
  it 'creates new user' do
    expect(users).to receive(:create).with(user_params) { user }
    subject.create params: user_params
  end
end
