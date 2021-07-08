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
    song = self.new
    song.save
    song
  end

  
  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end


  def self.create_by_name(name)
    song = new_by_name(name)
    song.save
    song
  end


  def self.find_by_name(name)
    @@all.find do |song|
      song.name === name
    end
  end

# This method will accept a string name for a song and either return a matching song instance with that name or create a new song with the name and return the song instance.
  def self.find_or_create_by_name(name)
    self.find_by_name(name) ? self.find_by_name(name) : self.create_by_name(name)
    # self.find_by_name(name) || self.create_by_name(name) <-or operator conditional
  end


  def self.alphabetical
    @@all.sort do |a, b|
      a.name <=> b.name
    end 
  end


  def self.new_from_filename(filename)
    parts = filename.split(" - ")
    artist_name = parts[0]
    song_name = parts[1].gsub(".mp3", "")

    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
    # binding.pry
  end


  def self.create_from_filename(filename)
    parts = filename.split(" - ")
    artist_name = parts[0]
    song_name = parts[1].gsub(".mp3", "")

    song = self.create
    song.name = song_name
    song.artist_name = artist_name
    song
  end


  def self.destroy_all
    @@all.clear
  end


end
