json.extract! match, :id, :first_player_id, :second_player_id, :match_datetime, :is_match_started, :is_match_finished, :is_first_player_win, :is_first_player_surrender, :is_second_player_surrender, :first_player_sets, :second_player_sets, :created_at, :updated_at
json.url match_url(match, format: :json)
