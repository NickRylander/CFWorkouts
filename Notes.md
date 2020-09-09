# What do I want my program to do?
    1. Scrape the CrossFit website
    2. Choose which month I want to view from a numerated list.
    3. Choose what day of the month I want to view from a numerated list.
    4. Show the user the workout for that specific day.
    5. Be able to toggle back to view other months or days at any point.

# Bones
    1. bin/run
        - Runs my gem
    2. lib/month
        - Should be able to create and store all months.
        - Knows all instances of days
    3. lib/day
        - Should be able to create and store all days.
    4. lib/workout <= maybe?
        - NA
    5. lib/scraper
        - Should scrape the webpage for months/days/workouts