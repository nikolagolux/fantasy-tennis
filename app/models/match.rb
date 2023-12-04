class Match < ApplicationRecord
  belongs_to :user, :foreign_key => 'first_player_id'
  belongs_to :user, :foreign_key => 'second_player_id'
  has_many :game_sets
  has_many :game_gems
  has_many :game_points

  after_create :create_initial_sets_and_gems
  after_update :create_initial_sets_and_gems

  def first_player_sets_2
    first_player_sets || 0
  end

  def second_player_sets_2
    second_player_sets || 0
  end

  def create_initial_sets_and_gems
    if self.game_sets.count == 0
      game_set = GameSet.create(match_id: self.id)
      if game_set.game_gems.count == 0
        game_gem = GameGem.create(match_id: self.id, game_set_id: game_set.id)
      end
    end
  end
  def predaj

  end
end
