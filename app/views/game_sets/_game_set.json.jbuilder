json.extract! game_set, :id, :match_id, :is_first_player_win, :first_player_gems, :second_player_gems, :created_at, :updated_at
json.url game_set_url(game_set, format: :json)
