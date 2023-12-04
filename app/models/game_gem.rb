class GameGem < ApplicationRecord
  belongs_to :game_set
  belongs_to :match
  has_many :game_points

  after_create :check_if_nil
  after_create :check_results_in_current_set

  def first_player_points_2
    first_player_points || 0
  end

  def second_player_points_2
    second_player_points || 0
  end

  def check_results_in_current_set
    # ...

    # GameSet.create (...)

  end

  def current_first_player_points
    first_player_points
  end

  def current_second_player_points
    second_player_points
  end
  
  def check_if_nil
    if self.first_player_points == nil || self.first_player_points == ""
      self.update(first_player_points: 0)
    end

    if self.second_player_points == nil || self.second_player_points == ""
      self.update(second_player_points: 0)
    end
  end
end
