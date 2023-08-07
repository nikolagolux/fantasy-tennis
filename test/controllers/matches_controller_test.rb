require "test_helper"

class MatchesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @match = matches(:one)
  end

  test "should get index" do
    get matches_url
    assert_response :success
  end

  test "should get new" do
    get new_match_url
    assert_response :success
  end

  test "should create match" do
    assert_difference('Match.count') do
      post matches_url, params: { match: { first_player_id: @match.first_player_id, first_player_sets: @match.first_player_sets, is_first_player_surrender: @match.is_first_player_surrender, is_first_player_win: @match.is_first_player_win, is_match_finished: @match.is_match_finished, is_match_started: @match.is_match_started, is_second_player_surrender: @match.is_second_player_surrender, match_datetime: @match.match_datetime, second_player_id: @match.second_player_id, second_player_sets: @match.second_player_sets } }
    end

    assert_redirected_to match_url(Match.last)
  end

  test "should show match" do
    get match_url(@match)
    assert_response :success
  end

  test "should get edit" do
    get edit_match_url(@match)
    assert_response :success
  end

  test "should update match" do
    patch match_url(@match), params: { match: { first_player_id: @match.first_player_id, first_player_sets: @match.first_player_sets, is_first_player_surrender: @match.is_first_player_surrender, is_first_player_win: @match.is_first_player_win, is_match_finished: @match.is_match_finished, is_match_started: @match.is_match_started, is_second_player_surrender: @match.is_second_player_surrender, match_datetime: @match.match_datetime, second_player_id: @match.second_player_id, second_player_sets: @match.second_player_sets } }
    assert_redirected_to match_url(@match)
  end

  test "should destroy match" do
    assert_difference('Match.count', -1) do
      delete match_url(@match)
    end

    assert_redirected_to matches_url
  end
end
