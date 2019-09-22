class Song
  attr_accessor :name, :artist_name

  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new
    self.all << song
    song
  end

  def self.new_by_name(song_name)
    song = Song.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.new_by_name(song_name)
    self.all << song
    song
  end

  def self.find_by_name(song_name)
    self.all.find { |song| song.name == song_name }
  end

  def self.find_or_create_by_name(song_name)
    if find_by_name(song_name)
      find_by_name(song_name)
    else
      self.create_by_name(song_name)
    end
  end

  def self.destroy_all
    self.all.clear
  end

  def self.alphabetical
    self.all.sort { |x, y| x.name <=> y.name }
  end

  def self.new_from_filename(filename)
    split_filename = filename.split("-")
    artist = split_filename[0].strip
    song_split = split_filename[1].split(".")
    song_name = song_split[0].strip

    song = Song.new
    song.name = song_name
    song.artist_name = artist
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    self.all << song
    song
  end

end
