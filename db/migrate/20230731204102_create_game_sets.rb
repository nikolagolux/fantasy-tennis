class CreateGameSets < ActiveRecord::Migration[6.1]
  def change
    create_table :game_sets do |t|
      t.references :match, null: false, foreign_key: true
      t.boolean :is_first_player_win
      t.integer :first_player_gems
      t.integer :second_player_gems

      t.timestamps
    end
  end
end
