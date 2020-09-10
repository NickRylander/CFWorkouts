class Day

    @@all = []
    attr_accessor :day

    def initialize(day)
        @day = day
        @@all << self
    end
    def self.all
        @@all
    end

end