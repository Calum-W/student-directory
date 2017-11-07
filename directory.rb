def print_header
    puts "The students of Villains Academy"
    puts "-------------"
end

def print_names(names)
    names.each_with_index do |student, index|
        puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
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
        students << {name: name, cohort: :november}
        puts "Now we have #{students.count} students"
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
