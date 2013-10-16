# Loading seed data

puts "\nLoading data for the previous TSL students.. "

load 'seeds.rb'

STUDENTS.each do |name|
  puts "#{name}"
end

# {"first_name"=>"Uday", "last_name"=>"Gorrepati", "twitter"=>nil, "github"=>nil, "blog"=>nil, "email"=>"uday.gorrepati@gmail.com"}





# CHALLENGE 1

# Using the each method and the STUDENTS array. Find Vince
# and return the following output:

# name: Vince Cabansag
# twitter: @vcabansag
# github: vcabansag
# blog: http://vincentcabansag.com
# email: vince@starterleague.com

puts "---------Challenge 1----------"

x = STUDENTS.select do |student|
student["last_name"] == "Cabansag"
end

found_vince = x.first
puts "name: #{found_vince["first_name"]} #{found_vince["last_name"]}"
puts "twitter: @#{found_vince["twitter"]}"
puts "github: #{found_vince["github"]}"
puts "blog: http://#{found_vince["blog"]}"
puts "email: #{found_vince["email"]}"

puts "---------Challenge 2----------"

# CHALLENGE 2

# Gather all of the Twitter handles into an array and show them on separate lines

twithandles = STUDENTS.collect do |student|
  student["twitter"]
end

puts twithandles


# CHALLENGE 3

# Update your script so that you only show values of a person if they're present
# We don't want to see "blog: " or "github: "

puts "---------Challenge 3----------"

#Create new array with student that have full info
active_students = STUDENTS.select  do |student|
     student["blog"] != nil && student["github"] != nil
end

#Loop through new array and print info
active_students.each do |student|

  puts "name: #{student["first_name"]} #{student["last_name"]}"
  puts "twitter: @#{student["twitter"]}"
  puts "github: #{student["github"]}"
  puts "blog: #{student["blog"]}"
  puts "email: #{student["email"]}"
  puts "===================================="

end

puts "There are #{STUDENTS.count} total students"
puts "There are #{active_students.count} active students"

# CHALLENGE 4

# Refactor your code to use the .keys method to access the key value pairs
# We don't need to explicity type every key. Play around with the .keys method.

puts "---------Challenge 4----------"

# active_students.each do |student|

active_students.each do |student|
  student.keys.each do |key|
    puts "#{key.gsub(/[_]/," ")}: #{student[key]}"
  end
 puts "================================="
end

# CHALLENGE 5

# Create a method to dispaly the details of a student
# Create a method to find a student by first name
# Take into account that the data set may continue people with the same names

# Remember, methods can look like this

# def show_student_details

# end

# or this

puts "---------Challenge 5----------"


def  show_student_details2(student_name)

    student_result = STUDENTS.select do |students|
        students["first_name"] == "#{student_name}"
    end

    if student_result.count >= 1
        student_result.each do |found_student|
          found_student.keys.each do |key|
            puts "#{key.gsub(/_/) { " " }}: #{found_student[key]}"
          end
          puts "================================="
        end
        if student_result.count > 1
          puts "There were #{student_result.count} students named #{student_name}"
        else
          puts "There was #{student_result.count} student named #{student_name}"
        end
    else
        puts "There was no student named #{student_name}"
    end

end

print "Enter first name:  "
username = gets.chomp.capitalize
show_student_details2(username)




















