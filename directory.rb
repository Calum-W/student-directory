def print_header
    puts "The students of Villains Academy"
    puts "-------------"
end

def print_names(names)
    names.each_with_index do |student, index|
        puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
        puts "Hobby: #{student[:hobby]}"
        puts "Country of birth: #{student[:country]}"
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
    puts "Overall, we have #{names.count} great students"
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
        students << {name: name, hobby: hobby, country: country, cohort: cohort}
        puts "Now we have #{students.count} students. Enter a name to add another student, or hit return to exit."
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
print_header
print_names(students)
print_footer(students)