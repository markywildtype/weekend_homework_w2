require("pry")

class Room

attr_reader :playlist, :capacity

  def initialize(playlist, capacity)
    @playlist = playlist
    @capacity = capacity
    @guests = []

  end



end
