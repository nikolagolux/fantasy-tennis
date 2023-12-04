class AddCurrentResultToGamePoints < ActiveRecord::Migration[6.1]
  def change
    add_column :game_points, :current_first_player_points, :string
    add_column :game_points, :current_second_player_points, :string
  end
end
