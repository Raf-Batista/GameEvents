require 'rails_helper'

RSpec.describe User, type: :model do

  it {should validate_presence_of(:username)}
  it {should validate_presence_of(:email)}
  it {should validate_presence_of(:password)}
  it do
     should validate_length_of(:password).
         is_at_least(5).
         on(:create)
  end
  it {should have_many(:games)}
  it {should have_many(:events)}

end
