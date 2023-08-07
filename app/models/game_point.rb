class GamePoint < ApplicationRecord
  belongs_to :game_gem
  belongs_to :game_set
  belongs_to :match
end
