class CFWorkouts::Scraper 
    
    MONTH_URL = "https://www.crossfit.com/workout/2020/"
    DAY_URL = "https://www.crossfit.com/"

    def self.scrape_months
        doc = Nokogiri::HTML(open(MONTH_URL))
        doc.css("select#monthFilter.form-control.input-sm").text.strip.split("\n                ").slice(1, 13).each do |months|
            month_number, month_name = months.split(" - ")
            CFWorkouts::Month.new(month_name, month_number)

        end
    end

    def self.scrape_days
        doc = Nokogiri::HTML(open(MONTH_URL))
        doc.css("section#archives.section").css(".show a").each do |day|
            name, date = day.text.split
            CFWorkouts::Day.new(name, date)
        end
    end

    def self.scrape_workouts
        doc = Nokogiri::HTML(open(DAY_URL))
        details = doc.css("div._6zX5t4v71r1EQ1b1O0nO2.jYZW249J9cFebTPrzuIl0").text
    end

end