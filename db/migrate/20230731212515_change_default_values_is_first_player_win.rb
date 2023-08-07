class ChangeDefaultValuesIsFirstPlayerWin < ActiveRecord::Migration[6.1]
  def change
    change_column_default :matches, :is_first_player_win, nil
    change_column_default :game_sets, :is_first_player_win, nil
    change_column_default :game_gems, :is_first_player_win, nil
  end
end
