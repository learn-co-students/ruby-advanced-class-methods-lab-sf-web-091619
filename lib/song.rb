class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    self.all << song
    song
  end

  def self.new_by_name(title)
    song = self.new
    song.name = title
    song
  end

  def self.create_by_name(title)
    song = self.create
    song.name = title
    song
  end

  def self.find_by_name(title)
    @@all.detect do |songs|
      songs.name == title
    end
  end

  def self.find_or_create_by_name(title)
    if self.find_by_name(title)
      self.find_by_name(title)
    else 
      self.create_by_name(title)
    end
  end

  def self.alphabetical
    @@all.sort_by do |songs|
      songs.name
    end
  end

  def self.new_from_filename(filename)
    new_song = self.new
    new_song.name = (filename.split(" - ")[1].chomp(".mp3"))
    new_song.artist_name = (filename.split(" - ")[0])
    new_song
  end

  def self.create_from_filename(filename)
      result = self.new_from_filename(filename)
      new_song = self.create
      new_song.name = result.name
      new_song.artist_name = result.artist_name
      new_song
  end

  def self.destroy_all
    self.all.clear
  end




end
