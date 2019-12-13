require "pry"
class MP3Importer

    attr_reader :path
    
    @@files = []
    
    def initialize(path)
        @path = path
    end

    def files
        Dir.each_child(@path){|filename| @@files << filename}
        @@files
    end

    def import
        files.each {|filename| Song.new_by_filename(filename)}
    end

end
