require 'rails_helper'

RSpec.describe 'the songs show page' do
  it "displays song title" do
    artist = Artist.create!(name: "Carly Rae Jepsen")
    song = artist.songs.create!(title: "I Really Like you", length: 208, play_count: 2456357)
    song_2 = artist.songs.create!(title: "Call me Maybe", length: 256, play_count: 2215456357)

    visit "/songs/#{song.id}"

    expect(page).to have_content(song.title)
    expect(page).to_not have_content(song_2.title)
  end

  it "displays name of artist for the song" do
    artist = Artist.create!(name: "Carly Rae Jepsen")
    song = artist.songs.create!(title: "I Really Like you", length: 208, play_count: 2456357)
    song_2 = artist.songs.create!(title: "Call me Maybe", length: 256, play_count: 2215456357)

    visit "/songs/#{song.id}"

    expect(page).to have_content(artist.name)

  end
end
