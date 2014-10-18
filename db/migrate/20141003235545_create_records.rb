class CreateRecords < ActiveRecord::Migration
	def change
		create_table :records do |t|
			t.integer :student_number
			t.string :first_name
			t.string :middle_name
			t.string :last_name
			t.string :region
			t.string :sts_bracket
			t.integer :app_status
    	end
  	end
end
 