require_relative '../../db/config'

class Student < ActiveRecord::Base
	validates :email, uniqueness: true
	validate :age_validator
	validate :email_validator
	validate :phonenum_validator
	has_many :teachers


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



# jer = Student.new(first_name: 'meowky',last_name: "haryrry",gender: 'boy',email: 'shsdrksssy@gmail.com',phone: '207 768 0712',birthday: '1970/1/1')
# p jer.save
# jer = Student.new(first_name: 'meowy',last_name: "bharynger",gender: 'boy',email: 'jrry@gmail.com',phone: '207 768 0712',birthday: '1972/1/1')
# p jer.save
# jer = Student.new(first_name: 'meow',last_name: "miharyud",gender: 'boy',email: 'nic@gmail.com',phone: '207 768 0712',birthday: '1973/1/1')
# p jer.save
# jer = Student.new(first_name: 'meowy',last_name: "mharyaud",gender: 'boy',email: 'lary@gmail.com',phone: '207 768 0712', birthday: '1974/1/1')
# p jer.save
# jer = Student.new(first_name: 'meow',last_name: "miharyud",gender: 'girl',email: 'jon@gmail.com',phone: '207 768 0712', birthday: '1975/1/1')
# p jer.save
# jer = Student.new(first_name: 'meowin',last_name: "haryhaud",gender: 'boy',email: 'dstin@gmail.com',phone: '207 768 0712', birthday: '1976/1/1')
# p jer.save
# jer = Student.new(first_name: 'meow',last_name: "miharyud",gender: 'boy',email: 'kyl@gmail.com',phone: '207 768 0712', birthday: '1977/1/1')
# p jer.save
# jer = Student.new(first_name: 'meowe',last_name: "lhary",gender: 'girl',email: 'jaim@gmail.com',phone: '207 768 0712', birthday: '1978/1/1')
# p jer.save
# jer = Student.new(first_name: 'meowon',last_name: "haryhaud",gender: 'girl',email: 'lison@gmail.com',phone: '207 768 0712', birthday: '1990/1/1')
# p jer.save