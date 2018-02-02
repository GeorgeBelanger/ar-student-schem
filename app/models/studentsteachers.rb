require_relative '../../db/config'

class StudentsTeachers < ActiveRecord::Base
	def self.randteacher
		return rand(1..9)
	end

	def self.randstudent
		return rand(1..9)
	end
end

# san = StudentsTeachers.new(student_id: StudentsTeachers.randstudent, teacher_id: StudentsTeachers.randteacher)
# p san.save