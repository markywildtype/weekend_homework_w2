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
    unless @capacity <= 0 
      @guests << guest
      @capacity -= 1
    else
      return "I'm sorry, this room is full, #{guest} will have to wait!"
    end
  end

  def add_to_playlist(song)
    @playlist << song
  end

end
