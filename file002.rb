class Playlist
  include MyEnumerable

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    @songs << song
  end

  def each
    @songs.each { |song| yield song }
  end

  def play_songs
    each { |song| song.play }
  end

  def each_by_tagline
    @songs.each { |song| yield "#{song.name} - #{song.artist}"}
  end

  def each_by_artist(artist)
    #each { |song| yield song if song.artist == artist }
    my_select { |song| song.artist == artist }.each { |song| yield song }
  end
end