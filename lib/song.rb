class Song
  attr_accessor :artist_name
  @@all = []

  def self.all
    @@all
  end
  def name
    @name
  end
  def name=(name)
    @name = name
  end

  def save
    self.class.all << self
  end

  def initialize(name = nil)
    @name = name
  end

  def self.create
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = Song.new(name)
    
  end
  def self.create_by_name(name)
    song = Song.new(name)
    song.save
    song
  end
  def self.find_by_name(name)
    @@all.find do |x|
      x.name == name
    end
  end
  def self.find_or_create_by_name(name)
    self.create_by_name(name)
    self.find_by_name(name)
  end
  def self.alphabetical
    @@all.sort_by{|x| x.name}
  end
  def self.new_from_filename(name)
    name_array = name.split(/[-]/)
    artist_name = name_array[0].strip
    song_name = name_array[1].strip.delete_suffix('.mp3')
    song = Song.new(song_name)
    song.artist_name = artist_name
    song
  end
  def self.create_from_filename(name)
    # name_array = name.split(/[-]/)
    # artist_name = name_array[0].strip
    # song_name = name_array[1].strip.delete_suffix('.mp3')
    # song = Song.new(song_name)
    # song.artist_name = artist_name
    song = self.new_from_filename(name)
    song.save
    song
  end
  def self.destroy_all
    @@all.clear
  end

  # def self.new_by_name(name)
  #   @@all << self.new
  #   self
  # end
end
