require_relative '../config'

# class CreateTeachers < ActiveRecord::Migration[5.0]
# 	 def change
#     create_table :teachers do |t|
#       t.string :first_name
#       t.string :last_name
#       t.string :gender
#       t.string :email
#       t.string :phone
#       t.date   :birthday
#       t.datetime :created_at
#       t.datetime :updated_at 
#     end
#   end
# end

class ChangeColumnsOnTeachers < ActiveRecord::Migration[5.0]
  def up
    add_column :teachers, :name, :string


    Teacher.all.each do |patient|
      # use the :column_to_be_deleted to update the 3 new columns
      teacher.update(name: "#{teacher.first_name} #{teacher.last_name}")
    end

    remove_column :teachers, :first_name
    remove_column :teachers, :last_name
  end

  def down
    add_column :teachers, :first_name, :string
    add_column :teachers, :last_name, :string

    Teacher.all.each do |teacher|
      # use the 3 new columns to join them into 1 column
      name_info = teacher.name.split(" ")
      first_name = name_info[0]
      first_name = name_info[1]
      teacher.update(
        first_name: first_name,
        last_name: last_name,
              )
    end

    remove_column :teachers, :name
  end
end