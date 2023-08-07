class GameGem < ApplicationRecord
  belongs_to :set
  belongs_to :match
  has_many :game_points
end
