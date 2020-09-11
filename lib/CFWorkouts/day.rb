class CFWorkouts::Day 
    
    attr_accessor :name, :date, :workout, :day

    @@all = []

    def initialize(name, date)
        self.name = name
        self.date = date
        @@all << self
    end
    def self.all
        @@all
    end

end
