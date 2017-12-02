require("pry")

class Room

attr_reader :playlist, :capacity, :guests, :entry_fee
attr_accessor :till

  def initialize(playlist, capacity)
    @playlist = playlist
    @capacity = capacity
    @guests = []
    @entry_fee = 15
    @till = 0
  end

  def add_guest(guest)
    if @capacity > 0 && guest.wallet() >= @entry_fee
      @guests << guest
      @capacity -= 1
      @till += 15
      take_money(guest, 15)
      # guest.wallet() -= 15
    else
      return "I'm sorry, you can't come in, #{guest.name()}."
    end
  end

  def take_money(guest, amount)
    guest.wallet -= amount
  end

  def add_to_playlist(song)
    @playlist << song
  end

end
