class Match < ApplicationRecord
  belongs_to :user, :foreign_key => 'first_player_id_id'
  belongs_to :user, :foreign_key => 'second_player_id_id'
  has_many :game_sets
  has_many :game_gems
  has_many :game_points
end
