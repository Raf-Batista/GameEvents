class Event < ApplicationRecord
  validates :title, :presence => true
  validates :description, :presence => true
  belongs_to :game
end
