class Month
    @@all = []
    attr_accessor :month

    def initialize(month)
        @month = month
        @@all << self
    end
    def self.all
        @@all
    end

end