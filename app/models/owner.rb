class Owner < ApplicationRecord
  belongs_to :user
  belongs_to :game
  validates :experience, inclusion: { in: %w(beginner intermediate expert),
    message: "%{value} must be beginner, intermediate, or expert" }
end
