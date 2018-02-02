require_relative '../../db/config'

class Teacher < ActiveRecord::Base
	validates :email, uniqueness: true
	has_many :students 
end


# jer = Teacher.new(first_name: 'sharky',last_name: "sperry",gender: 'boy',email: 'sharky@gmail.com',phone: '207 768 0712',birthday: '1970/1/1')
# p jer.save
# jer = Teacher.new(first_name: 'jerry',last_name: "belanger",gender: 'boy',email: 'jerry@gmail.com',phone: '207 768 0712',birthday: '1972/1/1')
# p jer.save
# jer = Teacher.new(first_name: 'nick',last_name: "michaud",gender: 'boy',email: 'nick@gmail.com',phone: '207 768 0712',birthday: '1973/1/1')
# p jer.save
# jer = Teacher.new(first_name: 'larry',last_name: "michaud",gender: 'boy',email: 'larry@gmail.com',phone: '207 768 0712',birthday: '1974/1/1')
# p jer.save
# jer = Teacher.new(first_name: 'joan',last_name: "michaud",gender: 'girl',email: 'joan@gmail.com',phone: '207 768 0712',birthday: '1975/1/1')
# p jer.save
# jer = Teacher.new(first_name: 'dustin',last_name: "michaud",gender: 'boy',email: 'dustin@gmail.com',phone: '207 768 0712',birthday: '1976/1/1')
# p jer.save
# jer = Teacher.new(first_name: 'kyle',last_name: "michaud",gender: 'boy',email: 'kyle@gmail.com',phone: '207 768 0712',birthday: '1977/1/1')
# p jer.save
# jer = Teacher.new(first_name: 'jaime',last_name: "long",gender: 'girl',email: 'jaime@gmail.com',phone: '207 768 0712',birthday: '1978/1/1')
# p jer.save
# jer = Teacher.new(first_name: 'alison',last_name: "michaud",gender: 'girl',email: 'alison@gmail.com',phone: '207 768 0712',birthday: '1990/1/1')
# p jer.save
