class User < ApplicationRecord
  validates :username, :presence => true
  validates :email, :presence => true
  validates :password, :length => { :in => 5..20 }
  has_many :owners
  has_many :games, :through => :owners
  has_many :events
  has_secure_password
end
