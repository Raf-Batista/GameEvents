class Game < ApplicationRecord
  validates :title, :presence => true
  has_many :owners
  has_many :users, :through => :owners
  has_many :game_events
  has_many :events, :through => :game_events
  has_many :game_genres
  has_many :genres, :through => :game_genres
end
