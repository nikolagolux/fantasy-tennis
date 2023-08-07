require "test_helper"

class GameSetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @game_set = game_sets(:one)
  end

  test "should get index" do
    get game_sets_url
    assert_response :success
  end

  test "should get new" do
    get new_game_set_url
    assert_response :success
  end

  test "should create game_set" do
    assert_difference('GameSet.count') do
      post game_sets_url, params: { game_set: { first_player_gems: @game_set.first_player_gems, is_first_player_win: @game_set.is_first_player_win, match_id: @game_set.match_id, second_player_gems: @game_set.second_player_gems } }
    end

    assert_redirected_to game_set_url(GameSet.last)
  end

  test "should show game_set" do
    get game_set_url(@game_set)
    assert_response :success
  end

  test "should get edit" do
    get edit_game_set_url(@game_set)
    assert_response :success
  end

  test "should update game_set" do
    patch game_set_url(@game_set), params: { game_set: { first_player_gems: @game_set.first_player_gems, is_first_player_win: @game_set.is_first_player_win, match_id: @game_set.match_id, second_player_gems: @game_set.second_player_gems } }
    assert_redirected_to game_set_url(@game_set)
  end

  test "should destroy game_set" do
    assert_difference('GameSet.count', -1) do
      delete game_set_url(@game_set)
    end

    assert_redirected_to game_sets_url
  end
end
