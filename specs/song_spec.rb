require("minitest/autorun")
require("minitest/rg")
require_relative("../song.rb")

class TestSong < Minitest::Test

  def setup
    @song1 = Song.new("Ignition: Remix")
  end

  def test_song_title
    assert_equal("Ignition: Remix", @song1.title)
  end

end
