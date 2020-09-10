class CFWorkouts::Day 
    
    attr_accessor :name, :url, :month

    @@all = []

    def initialize(name, url)
        @name = name
        @url = url
        @@all << self
    end
    def self.all
        @@all
    end

end
