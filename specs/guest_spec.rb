require("minitest/autorun")
require("minitest/rg")
require_relative("../guest.rb")
require_relative("../room.rb")
require_relative("../song.rb")

class TestGuest < Minitest::Test

  def setup
    @guest1 = Guest.new("Marky", 12)

  end

  def test_guest_name
    assert_equal("Marky", @guest1.name())
  end


end
