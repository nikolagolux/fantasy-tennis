require "application_system_test_case"

class GameGemsTest < ApplicationSystemTestCase
  setup do
    @game_gem = game_gems(:one)
  end

  test "visiting the index" do
    visit game_gems_url
    assert_selector "h1", text: "Game Gems"
  end

  test "creating a Game gem" do
    visit game_gems_url
    click_on "New Game Gem"

    fill_in "First player points", with: @game_gem.first_player_points
    check "Is first player serve" if @game_gem.is_first_player_serve
    check "Is first player win" if @game_gem.is_first_player_win
    fill_in "Match", with: @game_gem.match_id
    fill_in "Second player points", with: @game_gem.second_player_points
    fill_in "Set", with: @game_gem.set_id
    click_on "Create Game gem"

    assert_text "Game gem was successfully created"
    click_on "Back"
  end

  test "updating a Game gem" do
    visit game_gems_url
    click_on "Edit", match: :first

    fill_in "First player points", with: @game_gem.first_player_points
    check "Is first player serve" if @game_gem.is_first_player_serve
    check "Is first player win" if @game_gem.is_first_player_win
    fill_in "Match", with: @game_gem.match_id
    fill_in "Second player points", with: @game_gem.second_player_points
    fill_in "Set", with: @game_gem.set_id
    click_on "Update Game gem"

    assert_text "Game gem was successfully updated"
    click_on "Back"
  end

  test "destroying a Game gem" do
    visit game_gems_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Game gem was successfully destroyed"
  end
end
