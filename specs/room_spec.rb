require("minitest/autorun")
require("minitest/rg")
require_relative("../room.rb")
require_relative("../song.rb")
require_relative("../guest.rb")

class TestRoom < Minitest::Test

  def setup
    @song1 = Song.new("Ignition: Remix")
    @song2 = Song.new("Lose Yourself")
    @song3 = Song.new("Screamager")
    @song4 = Song.new("Blank Space")
    @song5 = Song.new("Glitter and Trauma")
    @playlist = [@song1, @song2, @song3, @song4, @song5]
    @song6 = Song.new("The Fog")
    @room1 = Room.new(@playlist, 5)
    @guest1 = Guest.new("Marky", 15)
    @guest2 = Guest.new("Fraser", 20)
    @guest3 = Guest.new("David", 35)
    @guest4 = Guest.new("Kenoid", 18)
    @guest5 = Guest.new("Johnny", 28)
    @guest6 = Guest.new("Allan", 48)
    @guest7 = Guest.new("Andy", 12)
  end

  def test_room_capacity
    assert_equal(5, @room1.capacity)
  end

  def test_room_playlist
    assert_equal(@playlist, @room1.playlist())
  end

  def test_room_entry_fee
    assert_equal(15, @room1.entry_fee)
  end

  def test_add_guest
    @room1.add_guest(@guest6)
    assert_equal(1, @room1.guests().count)
    # assert_equal(15, @room1.till())
    # assert_equal(33, @guest6.wallet())
  end

  def test_add_to_playlist
    @room1.add_to_playlist(@song6)
    expected = [@song1, @song2, @song3, @song4, @song5, @song6]
    actual = @room1.playlist
    assert_equal(expected, actual)
  end

  def test_room_over_capacity
    @room1.add_guest(@guest1)
    @room1.add_guest(@guest2)
    @room1.add_guest(@guest3)
    @room1.add_guest(@guest4)
    @room1.add_guest(@guest5)
    @room1.add_guest(@guest6)
    assert_equal(5, @room1.guests().count())
    assert("I'm sorry, you can't come in, #{@guest6.name()}.")
  end

  def test_add_guest_costs_guest
    @room1.add_guest(@guest5)
    @room1.add_guest(@guest6)
    assert_equal(13, @guest5.wallet())
    assert_equal(33, @guest6.wallet())
  end

  def test_add_guest_adds_to_till
    @room1.add_guest(@guest1)
    assert_equal(15, @room1.till())
    @room1.add_guest(@guest2)
    assert_equal(30, @room1.till())
  end
end
