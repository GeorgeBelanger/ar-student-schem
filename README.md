ActiveRecord Student Schema
===========================
## The purpose of this repository is to test a many to many object using rspec


### Tests
For testing we raise an error if the db hasn't been migrated yet, valdiated by the table_exists?(:students) equaling true. To test the name and age method, it tests wheter @student responds to the method being called from an array with name and age, and tests whether it returns the correct age and name. We test creating a student with valid info to get past the validators and assign invalid emails to see if the regex validators work. We test the age validator as well as the phone regex validator. To test whether or not there are timestamps when migration happens, we look at every column in the students table to see if there is a created_at and a updated_at. If the column exists and has the proper datatype, found_column_at is changed to true and if both are true the test passes. Lastly, we validate the datatypes of our columns.

### Seeds
To seed we use a csv seed file for the students, with an all or nothing transaction that uses File.open(filename).each to take every line and split the values into and array on the commas using line.chomp.split(','), takes the first line of data to be the field names then when field names is no longer nil, combines the field names and the data values on every new line into a hash using a zip method and creates a new student with the hash.

### Migration
For the migrate files we have the standard change method to creat students, teachers and student teachers and we also have an convert name up and down migration file that changes @first_name and @last_name into one attribute @name by removing the first and last name attributes from the teacher on the up step and adds them in the down step, seperating or combining on the "space" with teacher.name.split(" ") in either step.

### Models
For the models, we have a few validators. A teacher has an email presence validated as well as uniqueness validated, has many students through student_teachers which is bound to teacher id with the attribute teacher_id. I used regex to validate email addresses and phone numbers, used time.now - birthday.year to validate someone being old enough, and gave a random function that takes the id of a random student by randomly picking a number from 1 to the amount of students and assigning the student_id to the corresponding students id. 
