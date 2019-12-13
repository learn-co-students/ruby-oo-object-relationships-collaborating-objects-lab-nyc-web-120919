require "pry"

class Song
    attr_accessor :artist, :name

    @@all = []

    def initialize(name = "", artist = "")
        @name = name
        @artist = artist
        save
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(filename)
        name = filename.split(" - ")[1]
        artist = Artist.new(filename.split(" - ")[0])
        song = self.new(name, artist)
        song
    end

    def artist_name=(artist_name)
        if self.artist == ""
            self.artist = Artist.new(artist_name)
        end
    end

end