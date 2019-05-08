require 'rails_helper'

RSpec.describe User, type: :model do

  it {should validate_presence_of(:username)}
  it do
     should validate_length_of(:password).
         is_at_least(5).
         on(:create)
  end
  it do
     should validate_length_of(:password).
         is_at_most(20).
         on(:create)
  end
  it {should have_many(:games)}
  it {should have_many(:events)}

end
