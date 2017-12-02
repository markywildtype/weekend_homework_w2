class Guest

attr_reader :name, :favourite_song
attr_accessor :wallet

  def initialize(name, wallet, favourite_song)
    @name = name
    @wallet = wallet
    @favourite_song = favourite_song
  end

  def favourite_song_on_playlist(playlist, favourite_song)
    for song in playlist
      if song.title == favourite_song
        return "Woohoo! I LOVE #{favourite_song}!"
      end
    end
  end

end
