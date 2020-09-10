class CFWorkouts::CLI 
    def run
        puts "Welcome to the CrossFit WOD Selector!"
        puts "WOD = Workout of the Day"
        puts "First, let's choose a month!"
        CFWorkouts::Scraper.scrape_months
        list_months
    end
    def list_months
        CFWorkouts::Month.all.each.with_index(1).each do |month, i|
            puts "#{i}. #{month.month_name}"
        end
        puts "Please type the number associated with the month you would like to view."
        options_menu
        input = gets.chomp.to_i-1
    end
    def options_menu
        puts "Want to view a different month? Type \"Months\""
        puts "Want to view a different day? Type \"Days\""
        puts "Want to exit the program? Type \"Exit\""

    end
end

# 1. Run the program
#     - Welcome statement
#     - List the months
#     - Options menu
# 2. Get user input to choose month
#     - If the input is valid, return the list of days
#         - Options menu
#     - If the input is not valid, try again
# 3. Get user input to choose day
#     - If valid, return te workout
#         - Options menu
#     - If the input is not valid, try again
# 4. Options menu
#     - Would you like to see the month list again?
#     - Would you like to see the days list again?
#     - Would you like to exit the program?