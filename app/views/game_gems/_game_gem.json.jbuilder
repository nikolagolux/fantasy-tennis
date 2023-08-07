json.extract! game_gem, :id, :set_id, :match_id, :is_first_player_win, :first_player_points, :second_player_points, :is_first_player_serve, :created_at, :updated_at
json.url game_gem_url(game_gem, format: :json)
