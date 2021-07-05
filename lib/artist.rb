require 'pry'
class Artist 
    attr_accessor :name

    @@all = []
    def initialize(name)
        @name = name
        @@all << self 
    end 

    def self.all
        @@all
    end
    
    def songs 
        #binding.pry 
        Song.all.select do |song|
            #binding.pry 
            song.artist == self 
        end  
    end 

    def add_song(song_one)
        #binding.pry 
        song_one.artist = self 
    end
    
    def self.find_or_create_by_name(name)
        artist = @@all.find {|artist| artist.name == name}
        artist = Artist.new(name) if artist == nil
        return artist 
    end 

    def print_songs
        songs.each {|song| puts song.name}
    end 


end 