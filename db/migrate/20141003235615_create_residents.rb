class CreateResidents < ActiveRecord::Migration
	def change
    	create_table :residents do |t|
    		t.integer :student_number
    		t.references :dorm, index: true
    	end
  	end
end
