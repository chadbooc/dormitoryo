class CreateApplicants < ActiveRecord::Migration
  	def change
    	create_table :applicants do |t|
    		t.references :dorm, index: true
    		t.integer :student_number
    		t.integer :priority
    		t.boolean :is_renewing, default:false
    	end
  	end
end
