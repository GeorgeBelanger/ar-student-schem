require_relative '../config'

class CreateStudentsTeachers < ActiveRecord::Migration[5.0]
  def change
    create_table :students_teachers do |t|
      t.integer :student_id
      t.integer :teacher_id
      t.datetime :created_at
      t.datetime :updated_at 
    end
  end
end