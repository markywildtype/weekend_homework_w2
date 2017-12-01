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
    return if @capacity <= 0
  if guest.wallet() >= @entry_fee
      @guests << guest
      @capacity -= 1
    else
      return "I'm sorry, you can't come in, #{guest.name()}."
    end
  end

  def add_to_playlist(song)
    @playlist << song
  end

end
