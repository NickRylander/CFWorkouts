class CFWorkouts::Day 
    
    attr_accessor :name, :date, :details

    @@all = []

    def initialize(name, date)
        self.name = name
        self.date = date
        @@all << self
    end
    def self.all
        @@all
    end
    def self.reset
        self.all.clear
    end
end
