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
    new_song = Song.new
    @@all << new_song
    new_song
  end 
  
  def self.new_by_name(name)
    new_song = Song.new
    new_song.name = name
    new_song
  end 

  def self.create_by_name(name)
    new_song = Song.new
    new_song.name = name
    @@all << new_song
    new_song
  end 
  
  def self.find_by_name(name) 
    @@all.find do |song|
      song.name == name
    end 
  end 
  
  def self.find_or_create_by_name(name) 
    if self.find_by_name(name)
      self.find_by_name(name)
    else 
      self.create_by_name(name)
    end 
  end 

  def self.alphabetical 
    @@all.sort_by {|song| song.name} 
  end 
  
  def self.new_from_filename(file_name)
    file_name_array = file_name.sub(/\.mp3/,"").split(" - ")
    new_song = Song.new
    @@all << new_song
    new_song.name = file_name_array[1]
    new_song.artist_name = file_name_array[0]
  end 

end
