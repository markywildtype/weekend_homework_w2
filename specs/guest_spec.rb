require("minitest/autorun")
require("minitest/rg")
require_relative("../guest.rb")
require_relative("../room.rb")
require_relative("../song.rb")

class TestGuest < Minitest::Test

  def setup
    @guest1 = Guest.new("Marky", 12)
    @guest2 = Guest.new("Jeff", 35)
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
#add_guest is adding guests regardless of their wallet amount
  def test_guest_can_afford_room__false
    @room1.add_guest(@guest1)
    @room1.add_guest(@guest2)
    assert_equal(1, @room1.guests().count())
  end

end
