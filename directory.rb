@students = []

def print_header
    puts "The students of Villains Academy"
    puts "-------------"
end

def print_names(names)
    names.each_with_index do |student, index|
        puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)".center(40)
        puts "Hobby: #{student[:hobby]}".center(40)
        puts "Country of birth: #{student[:country]}".center(40)
    end
end

def print_footer(names)
    if names.size > 1
        puts "Overall, we have #{names.count} great students".center(40)
    else
        puts "We only have one student, but they are amazing".center(40)
    end
end

# Prompts the user to create the student list
def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    name = gets.strip
    while !name.empty? do
        puts "What is their hobby?"
        hobby = gets.strip
        puts "Where is their country of birth?"
        country = gets.strip.capitalize
        puts "Which cohort have they joined?"
        cohort = gets.strip
        # gives a default cohort of November if user doesn't enter one
        cohort = :November if cohort.empty?
        cohort = cohort.capitalize.to_sym
        months = [:January, :February, :March, :April, :May, :June, :July, :August, :September, :October, :November, :December]
        # checks there are no typos in cohort
        until months.include?(cohort)
            puts "Cohort should be the full name of a month. Please check and try again"
            cohort = gets.strip
            cohort = cohort.capitalize.to_sym
        end
        @students << {name: name, hobby: hobby, country: country, cohort: cohort}
        puts "Now we have #{@students.count} student#{"s" if @students.size != 1}. Enter a name to add another student, or hit return to exit."
        name = gets.strip
    end
    @students
end

def show_students
    print_header
    print_names(@students)
    print_footer(@students)
end

def print_menu
    puts "Please choose an option by typing one of the following numbers"
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
end

def interactive_menu
    loop do
        print_menu
        selection = gets.chomp
        case selection
        when "1"
            @students = input_students
        when "2"
            show_students
        when "9"
            exit
        else
            puts "I don't know what you meant. Please enter a number"
        end
    end
end


interactive_menu



# optional methods not used by the main program
def letter_names(names, letter)
    names.each do |student|
        puts "#{student[:name]} (#{student[:cohort]} cohort)" if student[name].start_with? letter
    end
end

def length_names(names)
    names.each do |student|
        puts "#{student[:name]} (#{student[:cohort]} cohort)" if student[:name].length < 12
    end
end

def select_cohort(names, month)
    names.select { |student| student[:cohort] == month}
end

def print_names_while(names)
    counter = 0
    while counter < names.length do
        puts "#{counter + 1}. #{names[counter][:name]} (#{names[counter][:cohort]} cohort)"
        counter += 1
    end
end