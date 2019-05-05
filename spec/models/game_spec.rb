require 'rails_helper'

RSpec.describe Game, type: :model do
  it {should have_many(:users)}
  it {should have_many(:events)}
  it {should have_many(:genres)}
end
