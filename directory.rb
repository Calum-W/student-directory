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

def print_names_while(names)
    counter = 0
    while counter < names.length do
        puts "#{counter + 1}. #{names[counter][:name]} (#{names[counter][:cohort]} cohort)"
        counter += 1
    end
end

def print_footer(names)
    if names.size > 1
        puts "Overall, we have #{names.count} great students".center(40)
    else
        puts "We only have one student, but they are amazing".center(40)
    end
end

def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    students = []
    name = gets.chomp
    while !name.empty? do
        puts "What is their hobby?"
        hobby = gets.chomp
        puts "Where is their country of birth?"
        country = gets.chomp.capitalize
        puts "Which cohort have they joined?"
        cohort = gets.chomp
        # gives a default cohort of November if user doesn't enter one
        cohort = :November if cohort.empty?
        cohort = cohort.capitalize.to_sym
        months = [:January, :February, :March, :April, :May, :June, :July, :August, :September, :October, :November, :December]
        until months.include?(cohort)
            puts "Cohort should be the full name of a month. Please check and try again"
            cohort = gets.chomp
            cohort = cohort.capitalize.to_sym
        end
        students << {name: name, hobby: hobby, country: country, cohort: cohort}
        puts "Now we have #{students.count} student#{print "s" if students.size == 1}. Enter a name to add another student, or hit return to exit."
        name = gets.chomp
    end
    students
end

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

students = input_students
if !students.empty?
    print_header
    print_names(students)
    print_footer(students)
end