class CFWorkouts::CLI 
    def run
        CFWorkouts::Scraper.scrape_days(month)
    end
end