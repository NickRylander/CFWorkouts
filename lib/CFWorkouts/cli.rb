class CFWorkouts::CLI 
    def run
        puts "\n__Welcome to the CrossFit WOD Selector!__"
        puts "______First, let's choose a month!_______"
        CFWorkouts::Scraper.scrape_months
        puts "\nPlease type the number associated with the month you would like to view."
        list_months
        month_input
    end
    def list_months
        CFWorkouts::Month.all.each.with_index(1).each do |month, i|
            puts "#{i}. #{month.month_name}"
        end
    end
    def month_input
        print "Pick a number: "
        input = gets.chomp.to_i
        case input
        when 1..CFWorkouts::Month.all.length
            puts "\nYou chose a great month!"
            puts "\nNow, which day would you like to see?"
            list_days
            day_input
        else
            puts "Sorry, what was that?"
            month_input
        end
    end
    def list_days(day)
        CFWorkouts::Scraper.scrape_days(day)
        CFWorkouts::Day.all.reverse.each.with_index(1).each do |day, i|
            puts "#{i}. #{day.name} - #{day.date}"
        end
    end
    # def day_input
    #     print "Pick a number: "
    #     input = gets.chomp.to_i
    #     case input
    #     when 1..CFWorkouts::Day.all.length
    #         puts "\nYou chose a great day!"
    #         puts "\nHere's your workout!"
    #         puts "\nHave fun!"
    #         workout_details
    #     else
    #         puts "Sorry, what was that?"
    #         day_input
    #     end
    # end
    def options_menu
        puts "Want to view a different month? Type \"Months\""
        puts "Want to view a different day? Type \"Days\""
        puts "Want to exit the program? Type \"Exit\""
        input = gets.chomp.downcase
        case input
        when "months"
            list_months
        when "days"
            list_days
        when "exit"
            exit
        else
            "There must have been a typo, try again!"
        end
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