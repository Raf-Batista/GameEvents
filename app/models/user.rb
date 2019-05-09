class User < ApplicationRecord
  validates :username, :presence => true
  validates :password, :length => { :in => 5..20 }
  has_many :games
  has_many :game_events
  has_many :events, :through => :game_events
  has_secure_password
  accepts_nested_attributes_for :games
end
