require_relative '../config'

class CreateTeachers < ActiveRecord::Migration[5.0]
	 def change
    create_table :teachers do |t|
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.string :email
      t.string :phone
      t.date   :birthday
      t.datetime :created_at
      t.datetime :updated_at 
    end
  end
end