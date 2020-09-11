class CFWorkouts::CLI
    
    # ____________________RUN____________________

    def run
        welcome_title
        CFWorkouts::Scraper.scrape_months
        puts "\nPlease type the number associated with the month you would like to view."
        list_months
        month_input
    end

    # ____________________INPUT____________________

    def month_input
        print "\nPick a number to see all the days: "
        input = gets.chomp.to_i
        day = CFWorkouts::Month.all[input-1]
        case input
        when 1..CFWorkouts::Month.all.length
            puts "\nNow, which day would you like to see?"
            CFWorkouts::Day.reset
            list_days(day)
            day_input
        else
            puts "Sorry, what was that?"
            month_input
        end
    end

    def day_input
        print "\nPick a number to see the workout: "
        input = gets.chomp.to_i
        workout = CFWorkouts::Day.all.reverse[input-1]
        case input
        when 1..CFWorkouts::Day.all.length
            workout_title
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
        menu_title
        puts "\nWant to view a different month? Type \"M\""
        puts "Want to view a different day? Type \"D\""
        puts "Want to exit the program? Type \"E\""
        print "Type here: "
        input = gets.chomp.downcase
        case input
        when "m"
            puts "\nWhich month would you like to see instead?"
            list_months
            month_input
        when "d"
            puts "\nWhich day would you like to see instead?"
            day_input
        when "e"
            goodbye_title
            exit
        else
            puts "\nThere must have been a typo, try again!"
            options_menu
        end
     end

    # ____________________TITLE____________________

    def welcome_title
        puts "░█████╗░███████╗  ░██╗░░░░░░░██╗░█████╗░██████╗░  ░██████╗███████╗██╗░░░░░███████╗░█████╗░████████╗░█████╗░██████╗░"
        puts "██╔══██╗██╔════╝  ░██║░░██╗░░██║██╔══██╗██╔══██╗  ██╔════╝██╔════╝██║░░░░░██╔════╝██╔══██╗╚══██╔══╝██╔══██╗██╔══██╗"
        puts "██║░░╚═╝█████╗░░  ░╚██╗████╗██╔╝██║░░██║██║░░██║  ╚█████╗░█████╗░░██║░░░░░█████╗░░██║░░╚═╝░░░██║░░░██║░░██║██████╔╝"
        puts "██║░░██╗██╔══╝░░  ░░████╔═████║░██║░░██║██║░░██║  ░╚═══██╗██╔══╝░░██║░░░░░██╔══╝░░██║░░██╗░░░██║░░░██║░░██║██╔══██╗"
        puts "╚█████╔╝██║░░░░░  ░░╚██╔╝░╚██╔╝░╚█████╔╝██████╔╝  ██████╔╝███████╗███████╗███████╗╚█████╔╝░░░██║░░░╚█████╔╝██║░░██║"
        puts "░╚════╝░╚═╝░░░░░  ░░░╚═╝░░░╚═╝░░░╚════╝░╚═════╝░  ╚═════╝░╚══════╝╚══════╝╚══════╝░╚════╝░░░░╚═╝░░░░╚════╝░╚═╝░░╚═╝"
    end
    def workout_title
        puts ""
        puts "▒█░░▒█ █▀▀█ █░░█ █▀▀█ 　 █░░░█ █▀▀█ █▀▀█ █░█ █▀▀█ █░░█ ▀▀█▀▀"
        puts "▒█▄▄▄█ █░░█ █░░█ █▄▄▀ 　 █▄█▄█ █░░█ █▄▄▀ █▀▄ █░░█ █░░█ ░░█░░"
        puts "░░▒█░░ ▀▀▀▀ ░▀▀▀ ▀░▀▀ 　 ░▀░▀░ ▀▀▀▀ ▀░▀▀ ▀░▀ ▀▀▀▀ ░▀▀▀ ░░▀░░"
    end
    def menu_title
        puts "▒█▀▄▀█ ▒█▀▀▀ ▒█▄░▒█ ▒█░▒█"
        puts "▒█▒█▒█ ▒█▀▀▀ ▒█▒█▒█ ▒█░▒█"
        puts "▒█░░▒█ ▒█▄▄▄ ▒█░░▀█ ░▀▄▄▀"
    end
    def goodbye_title
        puts "░██████╗░░█████╗░  ████████╗░█████╗░██╗░░██╗███████╗  ░█████╗░  ███╗░░██╗░█████╗░██████╗░"
        puts "██╔════╝░██╔══██╗  ╚══██╔══╝██╔══██╗██║░██╔╝██╔════╝  ██╔══██╗  ████╗░██║██╔══██╗██╔══██╗"
        puts "██║░░██╗░██║░░██║  ░░░██║░░░███████║█████═╝░█████╗░░  ███████║  ██╔██╗██║███████║██████╔╝"
        puts "██║░░╚██╗██║░░██║  ░░░██║░░░██╔══██║██╔═██╗░██╔══╝░░  ██╔══██║  ██║╚████║██╔══██║██╔═══╝░"
        puts "╚██████╔╝╚█████╔╝  ░░░██║░░░██║░░██║██║░╚██╗███████╗  ██║░░██║  ██║░╚███║██║░░██║██║░░░░░"
        puts "░╚═════╝░░╚════╝░  ░░░╚═╝░░░╚═╝░░╚═╝╚═╝░░╚═╝╚══════╝  ╚═╝░░╚═╝  ╚═╝░░╚══╝╚═╝░░╚═╝╚═╝░░░░░"
    end
end