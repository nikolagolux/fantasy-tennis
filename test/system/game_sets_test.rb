require "application_system_test_case"

class GameSetsTest < ApplicationSystemTestCase
  setup do
    @game_set = game_sets(:one)
  end

  test "visiting the index" do
    visit game_sets_url
    assert_selector "h1", text: "Game Sets"
  end

  test "creating a Game set" do
    visit game_sets_url
    click_on "New Game Set"

    fill_in "First player gems", with: @game_set.first_player_gems
    check "Is first player win" if @game_set.is_first_player_win
    fill_in "Match", with: @game_set.match_id
    fill_in "Second player gems", with: @game_set.second_player_gems
    click_on "Create Game set"

    assert_text "Game set was successfully created"
    click_on "Back"
  end

  test "updating a Game set" do
    visit game_sets_url
    click_on "Edit", match: :first

    fill_in "First player gems", with: @game_set.first_player_gems
    check "Is first player win" if @game_set.is_first_player_win
    fill_in "Match", with: @game_set.match_id
    fill_in "Second player gems", with: @game_set.second_player_gems
    click_on "Update Game set"

    assert_text "Game set was successfully updated"
    click_on "Back"
  end

  test "destroying a Game set" do
    visit game_sets_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Game set was successfully destroyed"
  end
end
