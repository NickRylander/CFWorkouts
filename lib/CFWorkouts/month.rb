class CFWorkouts::Month

    attr_accessor :month_name, :month_number, :day

    @@all = []

    def initialize(month_name, month_number)
        @month_name = month_name
        @month_number = month_number
        @@all << self
    end
    def self.all
        @@all
    end

end