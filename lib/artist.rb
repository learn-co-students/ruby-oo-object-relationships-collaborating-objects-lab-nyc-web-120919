require "pry"
class Artist
    attr_accessor :name, :title

    @@all = []

    def initialize(name)
        @name = name
        save
    end

    def save
        if !Artist.names.include?(self.name)
            @@all << self
        end
    end

    def self.all
        @@all
    end

    def songs
        Song.all.select {|song| song.artist == self}
    end

    def add_song(song)
        song.artist = self
    end

    def self.find_or_create_by_name(artist_arg)
        if self.all.find {|artist| artist.name == artist_arg}
            return self.all.find {|artist| artist.name == artist_arg}
        else Artist.new(artist_arg)
        end
    end

    def print_songs
        songs.each do |song| 
            puts song.name
        end
    end

    def self.names
        @@all.map {|artist| artist.name }
    end

end
