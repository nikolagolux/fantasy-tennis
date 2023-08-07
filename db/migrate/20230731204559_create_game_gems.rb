class CreateGameGems < ActiveRecord::Migration[6.1]
  def change
    create_table :game_gems do |t|
      t.references :game_set, null: false, foreign_key: true
      t.references :match, null: false, foreign_key: true
      t.boolean :is_first_player_win
      t.string :first_player_points
      t.string :second_player_points
      t.boolean :is_first_player_serve

      t.timestamps
    end
  end
end
