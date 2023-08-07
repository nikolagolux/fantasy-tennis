class GameGem < ApplicationRecord
  belongs_to :game_set
  belongs_to :match
  has_many :game_points
end
