json.extract! game_point, :id, :gem_id, :set_id, :match_id, :is_first_player_win, :created_at, :updated_at
json.url game_point_url(game_point, format: :json)
