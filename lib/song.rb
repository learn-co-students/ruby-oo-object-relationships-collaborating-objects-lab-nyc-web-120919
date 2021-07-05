require 'pry'

class Song
    attr_accessor :name, :artist

    @@all = []

    def initialize(name)
        @name = name
        @@all << self 
    end 

    def self.all 
        @@all
    end 

    def self.songs_by_artist(artist_name)
        #binding.pry
        @@all.select do |song| 
            if song.artist != nil 
                song.artist.name == artist_name 
            else 
                false  
            end 
        end 
    end 

    def self.new_by_filename(file_name)
       my_array = file_name.split(" - ")
       #binding.pry 
       my_song = Song.new(my_array[1])
       new_artist = Artist.new(my_array[0])
       my_song.artist = new_artist
       my_song
       #binding.pry
    end 

    def artist_name=(name)
        my_artist = Artist.find_or_create_by_name(name)
        @artist = my_artist
    end 


end 