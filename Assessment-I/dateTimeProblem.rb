print("-----------------space: O(1), time: O(1) ---------------------------\n")

require 'date'




=begin

Write a Program that takes Date/Time as an input (in DD-MM-YYYY HH:MM format) and displays the same in the following formats:
Input: 08-05-2024 11:26
Output:
Format #1: Wed, 8 May, 2024
Format #2: 05/08/2024
Format #3: 11:26 AM, Wednesday 08 May, 2024
Please use functions provided by Ruby Date,Time and DateTime classes here

=end



#prints the date in different formats
def getDateTimeFormats(dt)
   

    # Format: Wed, 8 May, 2024
    format1 = dt.strftime('%a, %e %B, %Y')
    puts(format1)
  
    # Format: 05/08/2024
    format2 = dt.strftime('%m/%d/%Y')
    puts(format2)
  
    # Format: 11:26 AM, Wednesday 08 May, 2024
    format3 = dt.strftime('%I:%M %p, %A %d %B, %Y')
    puts(format3)
end




#main function
def main()
    dateInput = gets().chomp()
    parsedDateTime = DateTime.parse(dateInput)

    getDateTimeFormats(parsedDateTime)
end


#explicitly calling the main function
main()
