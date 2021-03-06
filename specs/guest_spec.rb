require("minitest/autorun")
require("minitest/rg")
require_relative("../guest.rb")
require_relative("../room.rb")
require_relative("../song.rb")

class TestGuest < Minitest::Test

  def setup
    @guest1 = Guest.new("Marky", 12, "Sledgehammer")
    @guest2 = Guest.new("Jeff", 35, "No Scrubs")
    @guest3 = Guest.new("Louis", 20, "You Are My The Rock")
    @song1 = Song.new("No Scrubs")
    @song2 = Song.new("Sledgehammer")
    playlist = [@song1, @song2]
    @room1 = Room.new(playlist, 5)
  end

  def test_guest_name
    assert_equal("Marky", @guest1.name())
  end

  def test_guest_money
    assert_equal(12, @guest1.wallet())
  end

  def test_guest_can_afford_room__false
    @room1.add_guest(@guest1)
    assert_equal(0, @room1.guests().count())
  end

  def test_guest_can_afford_room__true
    @room1.add_guest(@guest2)
    assert_equal(1, @room1.guests().count())
    assert_equal([@guest2], @room1.guests())
  end

  def test_favourite_song
    assert_equal("Sledgehammer", @guest1.favourite_song)
  end

  def test_favourite_song_on_playlist__false
    assert_equal("Aw, they don't have You Are My The Rock!", @room1.add_guest(@guest3))
  end

  def test_favourite_song_on_playlist__true
    assert_equal("Woohoo! I LOVE No Scrubs!", @room1.add_guest(@guest2))
  end

end
