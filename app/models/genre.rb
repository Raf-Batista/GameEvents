class Genre < ApplicationRecord
  validates :title, :presence => true
  has_many :game_genres
  has_many :games, :through => :game_genres
end
