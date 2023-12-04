class GameSet < ApplicationRecord
  belongs_to :match
  has_many :game_gems

  after_create :check_if_nil
  after_create :check_match_result_in_sets

  def first_player_gems_2
    first_player_gems || 0
  end

  def second_player_gems_2
    second_player_gems || 0
  end

  def check_match_result_in_sets
    # ako je neko osvojio 3. set, onda napravi da je pobedio mec (update match-a)
  end

  def check_if_nil
    if self.first_player_gems == nil || self.first_player_gems == ""
      self.update(first_player_gems: 0)
    end

    if self.second_player_gems == nil || self.second_player_gems == ""
      self.update(second_player_gems: 0)
    end
  end
end
