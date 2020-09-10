class CFWorkouts::CLI 
    def run
        CFWorkouts::Scraper.scrape_months
    end
end