require "application_system_test_case"

class GamePointsTest < ApplicationSystemTestCase
  setup do
    @game_point = game_points(:one)
  end

  test "visiting the index" do
    visit game_points_url
    assert_selector "h1", text: "Game Points"
  end

  test "creating a Game point" do
    visit game_points_url
    click_on "New Game Point"

    fill_in "Gem", with: @game_point.gem_id
    check "Is first player win" if @game_point.is_first_player_win
    fill_in "Match", with: @game_point.match_id
    fill_in "Set", with: @game_point.set_id
    click_on "Create Game point"

    assert_text "Game point was successfully created"
    click_on "Back"
  end

  test "updating a Game point" do
    visit game_points_url
    click_on "Edit", match: :first

    fill_in "Gem", with: @game_point.gem_id
    check "Is first player win" if @game_point.is_first_player_win
    fill_in "Match", with: @game_point.match_id
    fill_in "Set", with: @game_point.set_id
    click_on "Update Game point"

    assert_text "Game point was successfully updated"
    click_on "Back"
  end

  test "destroying a Game point" do
    visit game_points_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Game point was successfully destroyed"
  end
end
