class CFWorkouts::Month

    attr_accessor :month_name, :month_number

    @@all = []

    def initialize(month_name, month_number)
        self.month_name = month_name
        self.month_number = month_number
        @@all << self
    end
    def self.all
        @@all
    end

end