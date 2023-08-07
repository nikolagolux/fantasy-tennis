class CreateMatches < ActiveRecord::Migration[6.1]
  def change
    create_table :matches do |t|
      t.references :first_player_id, null: false, foreign_key: { to_table: :users }
      t.references :second_player_id, null: false, foreign_key: { to_table: :users }
      t.datetime :match_datetime
      t.boolean :is_match_started
      t.boolean :is_match_finished
      t.boolean :is_first_player_win
      t.boolean :is_first_player_surrender
      t.boolean :is_second_player_surrender
      t.integer :first_player_sets
      t.integer :second_player_sets

      t.timestamps
    end
  end
end
