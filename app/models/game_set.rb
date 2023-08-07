class GameSet < ApplicationRecord
  belongs_to :match
  has_many :game_gems
end
