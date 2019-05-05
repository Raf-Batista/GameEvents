require 'rails_helper'

RSpec.describe Event, type: :model do
  it {should validate_presence_of(:title)}
  it {should validate_presence_of(:description)}
  it {should belongs_to(:game)}
end