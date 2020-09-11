class CFWorkouts::CLI
    
    # ____________________RUN____________________

    def run
        puts "\n__Welcome to the CrossFit WOD Selector!__"
        puts "______First, let's choose a month!_______"
        CFWorkouts::Scraper.scrape_months
        puts "\nPlease type the number associated with the month you would like to view."
        list_months
        month_input
    end

    # ____________________INPUT____________________

    def month_input
        print "\nPick a number: "
        input = gets.chomp.to_i
        day = CFWorkouts::Month.all[input-1]
        case input
        when 1..CFWorkouts::Month.all.length
            puts "\nYou chose a great month!"
            puts "\nNow, which day would you like to see?"
            list_days(day)
            day_input
        else
            puts "Sorry, what was that?"
            month_input
        end
    end

    def day_input
        print "\nPick a number: "
        input = gets.chomp.to_i
        workout = CFWorkouts::Day.all.reverse[input-1]
        case input
        when 1..CFWorkouts::Day.all.length
            puts "\nYou chose a great day!"
            puts "\nHere is the workout. Good luck!"
            puts "--------------------"
            workout_details(workout)
            puts "--------------------"
            options_menu
        else
            puts "Sorry, what was that?"
            day_input
        end
    end    

    # ____________________LIST____________________

    def list_months
        CFWorkouts::Month.all.each.with_index(1).each do |month, i|
            puts "#{i}. #{month.month_name}"
        end
    end

    def list_days(days)
        CFWorkouts::Scraper.scrape_days(days)
        CFWorkouts::Day.all.reverse.each.with_index(1).each do |day, i|
            puts "#{i}. #{day.name} - #{day.date}"
        end
    end

    def workout_details(workout)
        CFWorkouts::Scraper.scrape_workouts(workout)
        puts "#{workout.details}"
    end

    # ____________________MENU____________________

    def options_menu
        puts "\nWant to view a different month? Type \"Months\""
        puts "Want to view a different day? Type \"Days\""
        puts "Want to exit the program? Type \"Exit\""
        input = gets.chomp.downcase
        if input == "months"
            list_months
            month_input
        elsif input == "days"
            list_days(days)
            day_input
        elsif input == "exit"
            exit
        else
            puts "There must have been a typo, try again!"
            options_menu
        end
    end
end