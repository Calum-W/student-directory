@students = [] # an empty array accessible to all methods


def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
  # added a prompt above the options
  puts "Please choose an option below by entering a number"
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

# changed method name from "show students" to give a clearer idea of function
def print_all_info
  print_header
  print_student_list
  print_footer
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    print_all_info
  when "3"
    save_students
  when "4"
    load_students
  when "9"
    exit # this will cause the program to terminate
  else
    puts "I don't know what you meant, try again"
  end
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_student_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great student#{"s" if @students.count != 1}"
end

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = "students.csv")
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(",")
    cohort = cohort.to_sym
    add_students(name, cohort)
  end
  file.close
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # get the first name
  name = STDIN.gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    add_students(name, :November)
    name = STDIN.gets.chomp
  end
end

def add_students(name, cohort)
  @students << {name: name, cohort: cohort}
  puts "Now we have #{@students.count} student#{"s" if @students.count != 1}"
end

def try_load_students(filename = students.csv)
  filename = ARGV.first if !ARGV.first.nil?
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} student#{"s" if @students.count != 1} from #{filename}."
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end




interactive_menu
try_load_students