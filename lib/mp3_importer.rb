class MP3Importer

    attr_accessor :path

    @@file =[]

    def initialize(path)
        @path = path
        
    end 

    def files
        Dir.each_child(@path){|child|  @@file << child }
        @@file
    end 

    def import
        @@file.each do |file|
            Song.new_by_filename(file)
        end 
    end 

end 