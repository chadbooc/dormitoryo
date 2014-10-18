class CreateWaitlists < ActiveRecord::Migration
  	def change
    	create_table :waitlists do |t|
    		t.integer :student_number
    		t.integer :rank
    	end
 	end
end
