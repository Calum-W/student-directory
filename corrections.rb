def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
      students << {name: name, cohort: :november}
      # get another name from the user
      puts "Please enter the next student. Or press enter to exit"
      name = gets.chomp
  end
  puts "Now we have #{students.size} students"
  # return the array of students
  students
end

def print_header
  puts "The students of my cohort at Makers Academy"
  puts "-------------"
end

def print_names(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(names)
  print "Overall, we have #{names.size} great students"
end


students = input_students
print_header
print_names(students)
print_footer(students)