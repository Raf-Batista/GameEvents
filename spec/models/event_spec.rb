require 'rails_helper'

RSpec.describe Event, type: :model do
  it {should validate_presence_of(:title)}
  it {should validate_presence_of(:description)}
  it {should belong_to(:game)}
  it {should have_many(:users)}
end
