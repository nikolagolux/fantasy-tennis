require "application_system_test_case"

class MatchesTest < ApplicationSystemTestCase
  setup do
    @match = matches(:one)
  end

  test "visiting the index" do
    visit matches_url
    assert_selector "h1", text: "Matches"
  end

  test "creating a Match" do
    visit matches_url
    click_on "New Match"

    fill_in "First player id", with: @match.first_player_id
    fill_in "First player sets", with: @match.first_player_sets
    check "Is first player surrender" if @match.is_first_player_surrender
    check "Is first player win" if @match.is_first_player_win
    check "Is match finished" if @match.is_match_finished
    check "Is match started" if @match.is_match_started
    check "Is second player surrender" if @match.is_second_player_surrender
    fill_in "Match datetime", with: @match.match_datetime
    fill_in "Second player id", with: @match.second_player_id
    fill_in "Second player sets", with: @match.second_player_sets
    click_on "Create Match"

    assert_text "Match was successfully created"
    click_on "Back"
  end

  test "updating a Match" do
    visit matches_url
    click_on "Edit", match: :first

    fill_in "First player id", with: @match.first_player_id
    fill_in "First player sets", with: @match.first_player_sets
    check "Is first player surrender" if @match.is_first_player_surrender
    check "Is first player win" if @match.is_first_player_win
    check "Is match finished" if @match.is_match_finished
    check "Is match started" if @match.is_match_started
    check "Is second player surrender" if @match.is_second_player_surrender
    fill_in "Match datetime", with: @match.match_datetime
    fill_in "Second player id", with: @match.second_player_id
    fill_in "Second player sets", with: @match.second_player_sets
    click_on "Update Match"

    assert_text "Match was successfully updated"
    click_on "Back"
  end

  test "destroying a Match" do
    visit matches_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Match was successfully destroyed"
  end
end
