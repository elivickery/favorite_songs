require 'rails_helper'

feature "visiting the homepage" do
  scenario "the user sees a list of recent songs and can view them" do
    # Create a most recent game that should definitely appear in the list
    most_recent_song = Song.create!(title: "Oops I Did It Again", artist: "Britney Spears")

    visit "/"

    within(".list-of-songs") do
      expect(page).to have_content most_recent_song.title
      click_link("Show")
    end

    expect(page).to have_current_path song_path(most_recent_song)
  end

  xscenario "the user can start a new game" do
    visit '/'
    click_on('New Game')

    expect(page).to have_current_path new_game_path

  end
end
