class CreateGamePoints < ActiveRecord::Migration[6.1]
  def change
    create_table :game_points do |t|
      t.references :game_gem, null: false, foreign_key: true
      t.references :game_set, null: false, foreign_key: true
      t.references :match, null: false, foreign_key: true
      t.boolean :is_first_player_win

      t.timestamps
    end
  end
end
