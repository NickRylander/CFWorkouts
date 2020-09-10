class CFWorkouts::Scraper 
    
    MONTH_URL = "https://www.crossfit.com/workout/2020/"
    DAY_URL = "https://www.crossfit.com/"

    def self.scrape_months
        doc = Nokogiri::HTML(open(MONTH_URL))
        month_selector = doc.css("select#monthFilter.form-control.input-sm").text.strip.split("\n                ").slice(1, 13).each do |month|
            month_number, month_name = month.split(" - ")
            CFWorkouts::Month.new(month_name, month_number)
        end
    end

    def self.scrape_days

    end

    def self.scrape_workouts

    end

end