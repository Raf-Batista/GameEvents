require 'rails_helper'

RSpec.describe User, type: :model do

  it {should validate_presence_of(:username)}
  it {should validate_presence_of(:email)}
  it {should validate_presence_of(:password)}
  it 'is not valid when password confirmation does not match' do
    expect(User.create(:username => "test", :email => "test@example.com", :password => "test", :password_confirmation => "test123").valid?).to eq(false)
  end
  it do
     should validate_length_of(:password).
         is_at_least(5).
         on(:create)
  end
  it {should have_many(:games)}
  it {should have_many(:events)}

end
