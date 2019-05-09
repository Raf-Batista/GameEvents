class Game < ApplicationRecord
  validates :title, :presence => true
  has_many :owners
  has_many :users, :through => :owners
  has_many :game_events
  has_many :events, :through => :game_events
  belongs_to :genre
  has_many :events
end
