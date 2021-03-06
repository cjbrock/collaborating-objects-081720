class MP3Importer

    attr_accessor :path

    def initialize(path)
        @path = path
    end

    def files
  
        @files || = Dir.glob("#{path}/*.mp3").collect { | file | file.gsub("#{path}/", "") }


        # @files ||= Dir.entries(@path).select {|song| !File.directory?(song) && song.end_with?(".mp3")}
    end

    def import
        files.each { | file | Song.new_by_filename(file) }
    end

end