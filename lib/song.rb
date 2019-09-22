require 'pry'
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

  def self.new_by_name(name)
    new = Song.new
    new.name = name
    new
  end

  def self.create_by_name(name)
    new = Song.new
    new.name = name
    self.all << new
    new
  end

  def self.find_by_name(name)
    self.all.find { |info| info.name == name }
  end

  def self.find_or_create_by_name (input)
    ## returning the first array value vvv (<-THAT) seems like a hack.  ASK ABOUT THIS
    self.find_by_name(input) ? self.all[0] : self.create_by_name(input)
  end

  def self.alphabetical
    self.all.sort_by { |info| info.name }
  end

  def self.new_from_filename(filename)
    info = filename.split(" - ")
    info[1] = info[1][0..-5]
    new = Song.new
    new.name = info[1]
    new.artist_name = info[0]
    new
  end

  def self.create_from_filename(filename)
    new = new_from_filename(filename)
    self.all << new
  end

  def self.destroy_all
    @@all = []
  end
end
