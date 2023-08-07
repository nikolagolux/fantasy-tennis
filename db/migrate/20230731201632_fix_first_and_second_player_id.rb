class FixFirstAndSecondPlayerId < ActiveRecord::Migration[6.1]
  def change
    rename_column :matches, :first_player_id_id, :first_player_id
    rename_column :matches, :second_player_id_id, :second_player_id
  end
end
