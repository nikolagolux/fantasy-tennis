require "test_helper"

class GameGemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @game_gem = game_gems(:one)
  end

  test "should get index" do
    get game_gems_url
    assert_response :success
  end

  test "should get new" do
    get new_game_gem_url
    assert_response :success
  end

  test "should create game_gem" do
    assert_difference('GameGem.count') do
      post game_gems_url, params: { game_gem: { first_player_points: @game_gem.first_player_points, is_first_player_serve: @game_gem.is_first_player_serve, is_first_player_win: @game_gem.is_first_player_win, match_id: @game_gem.match_id, second_player_points: @game_gem.second_player_points, set_id: @game_gem.set_id } }
    end

    assert_redirected_to game_gem_url(GameGem.last)
  end

  test "should show game_gem" do
    get game_gem_url(@game_gem)
    assert_response :success
  end

  test "should get edit" do
    get edit_game_gem_url(@game_gem)
    assert_response :success
  end

  test "should update game_gem" do
    patch game_gem_url(@game_gem), params: { game_gem: { first_player_points: @game_gem.first_player_points, is_first_player_serve: @game_gem.is_first_player_serve, is_first_player_win: @game_gem.is_first_player_win, match_id: @game_gem.match_id, second_player_points: @game_gem.second_player_points, set_id: @game_gem.set_id } }
    assert_redirected_to game_gem_url(@game_gem)
  end

  test "should destroy game_gem" do
    assert_difference('GameGem.count', -1) do
      delete game_gem_url(@game_gem)
    end

    assert_redirected_to game_gems_url
  end
end
