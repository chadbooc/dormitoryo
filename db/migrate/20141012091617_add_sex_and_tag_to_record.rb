class AddSexAndTagToRecord < ActiveRecord::Migration
 	 def change
  		add_column :records, :sex, :string
		add_column :records, :student_tag, :string
  	end
end
