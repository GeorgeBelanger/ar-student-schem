require_relative '../../db/config'

class Person < ActiveRecord::Base
	validates :email, uniqueness: true
end

class Student < Person
    has_many :student_teachers, :foreign_key => :student_id
	has_many :teachers, :through => :student_teachers
	validate :age_validator
	validate :email_validator
	validate :phonenum_validator


	def phonenum_validator
		if (self.phone =~ /(\d{0,2})?.?[(]?\d{3,4}[)]?.?\d{3,4}.?\d{4}.?.?(\d{3,4})?/) == nil
			errors.add(:phone, 'phone not valid format, try again')
		end
	end

	def name
		"#{self.first_name} #{self.last_name}"
	end

	def age
		now = Date.today
	    ages = now.year - self.birthday.year - ((now.month > self.birthday.month || (now.month == self.birthday.month && now.day >= self.birthday.day)) ? 0 : 1)
	    p ages
	end

	def age_validator
		now = Date.today
	    ages = now.year - self.birthday.year - ((now.month > self.birthday.month || (now.month == self.birthday.month && now.day >= self.birthday.day)) ? 0 : 1)
		if ages < 5
			errors.add(:birthday, "Not old enough, try again")
		end
	end

	def email_validator
		if (self.email =~ /.{1,26}[@].{1,30}[\.].{2,6}/) == nil
			errors.add(:email, 'Email not valid format, try again')
		end
			
	end

	def self.assign
		return rand(1..9)
	end

end

class Teacher < Person
  has_many :student_teachers, :foreign_key => :teacher_id
  has_many :students, :through => :student_teachers
end

class StudentTeacher < ActiveRecord::Base
  belongs_to :student
  belongs_to :teacher
end