require("pry")

class Room

attr_reader :playlist, :capacity, :guests, :entry_fee

  def initialize(playlist, capacity)
    @playlist = playlist
    @capacity = capacity
    @guests = []
    @entry_fee = 15
  end

  def add_guest(guest)
    
      @guests << guest

  end

  def add_to_playlist(song)
    @playlist << song
  end

end
