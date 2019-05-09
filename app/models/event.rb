class Event < ApplicationRecord
  validates :title, :presence => true
  validates :description, :presence => true
  belongs_to :game
  has_many :game_events
  has_many :users, :through => :game_events
end
