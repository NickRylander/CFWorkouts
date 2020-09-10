class CFWorkouts::Month
     
    attr_accessor :name, :url, :workout

    @@all = []

    def initialize(name=nil, url=nil)
        @name = name
        @url = url
        @@all << self
    end
    def self.all
        @@all
    end

end